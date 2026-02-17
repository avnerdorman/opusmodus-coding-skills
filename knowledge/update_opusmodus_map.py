import os
import glob

ROOT_DIR = "English.lproj/system.omdocset"
SYSTEM_FUNCTIONS_DIR = os.path.join(ROOT_DIR, "System Functions")
DOCUMENTATION_DIR = os.path.join(ROOT_DIR, "Documentation")
OUTPUT_FILE = "knowledge/opusmodus_map.md"

def generate_map():
    with open(OUTPUT_FILE, "w") as f:
        f.write("# Opusmodus Documentation Map\n\n")
        
        # System Functions Section
        f.write("## System Functions\n\n")
        f.write("This section lists all available system functions grouped by category. Look for the `.opmo` examples or create new usages based on these names.\n\n")
        
        if os.path.exists(SYSTEM_FUNCTIONS_DIR):
            categories = sorted([d for d in os.listdir(SYSTEM_FUNCTIONS_DIR) if os.path.isdir(os.path.join(SYSTEM_FUNCTIONS_DIR, d))])
            for category in categories:
                cat_path = os.path.join(SYSTEM_FUNCTIONS_DIR, category)
                f.write(f"### {category}\n")
                
                # List PDFs (functions)
                functions = sorted([file[:-4] for file in os.listdir(cat_path) if file.endswith(".pdf")])
                if functions:
                    f.write(f"- {', '.join(functions)}\n")
                f.write("\n")
        else:
            f.write(f"Warning: {SYSTEM_FUNCTIONS_DIR} not found.\n")

        # Documentation / Examples Section
        f.write("\n## Documentation & Examples\n\n")
        f.write("These files contain `.opmo` usage examples which demonstrate how to call the functions.\n\n")
        
        if os.path.exists(DOCUMENTATION_DIR):
             # Walk through Documentation looking for .opmo files
            for root, dirs, files in os.walk(DOCUMENTATION_DIR):
                opmo_files = [file for file in files if file.endswith(".opmo")]
                if opmo_files:
                    rel_path = os.path.relpath(root, DOCUMENTATION_DIR)
                    if rel_path == ".":
                        rel_path = "Root"
                    f.write(f"### {rel_path}\n")
                    for opmo in sorted(opmo_files):
                         f.write(f"- {opmo}\n")
                    f.write("\n")
        else:
            f.write(f"Warning: {DOCUMENTATION_DIR} not found.\n")

if __name__ == "__main__":
    generate_map()
