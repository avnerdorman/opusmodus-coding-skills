import os
import sys

# Change working dir to project root
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.abspath(os.path.join(SCRIPT_DIR, "../../.."))

KNOWLEDGE_DIR = os.path.join(PROJECT_ROOT, "knowledge")
SYSTEM_FUNCTIONS_DIR = os.path.join(KNOWLEDGE_DIR, "system_functions")
MAP_FILE = os.path.join(KNOWLEDGE_DIR, "opusmodus_map.md")

def search_files(query):
    results = []
    
    # Search system functions
    for root, dirs, files in os.walk(SYSTEM_FUNCTIONS_DIR):
        for file in files:
            if file.endswith(".md"):
                file_path = os.path.join(root, file)
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        lines = f.readlines()
                        # Simple keyword search
                        for i, line in enumerate(lines):
                            if query.lower() in line.lower():
                                rel_path = os.path.relpath(file_path, PROJECT_ROOT)
                                context = line.strip()[:100]  # First 100 chars
                                results.append(f"- {rel_path} (L{i+1}): {context}")
                                # Only show one match per file to avoid spam
                                break 
                except Exception as e:
                    pass

    # Search Map
    if os.path.exists(MAP_FILE):
        with open(MAP_FILE, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            for i, line in enumerate(lines):
                 if query.lower() in line.lower():
                    context = line.strip()[:100]
                    rel_path = os.path.relpath(MAP_FILE, PROJECT_ROOT)
                    results.append(f"- {rel_path} (L{i+1}): {context}")
                    
    return results

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 doc_search.py <query>")
        sys.exit(1)
        
    query = " ".join(sys.argv[1:])
    print(f"Searching Opusmodus documentation for '{query}'...\n")
    
    results = search_files(query)
    
    if results:
        # Prioritize exact matches in filenames
        # (This logic is simple for now, just dumps results)
        for res in results[:20]: # Limit to top 20
            print(res)
        if len(results) > 20:
             print(f"\n...and {len(results)-20} more results.")
    else:
        print("No matches found.")

if __name__ == "__main__":
    main()
