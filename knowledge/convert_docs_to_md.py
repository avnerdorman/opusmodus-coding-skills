import os
import subprocess
import sys

# Configuration
# For this optimized version, we assume the PDFs are still in the original location on disk
# even if they are not in the git repo.
SOURCE_DIR = "English.lproj/system.omdocset/System Functions"
DEST_DIR = "knowledge/system_functions"

def ensure_dir(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

def convert_pdf_to_md(pdf_path, md_path):
    """
    Converts a PDF file to Markdown using pdftotext (if available) to preserve layout.
    """
    try:
        # construct command: pdftotext -layout input.pdf output.txt
        # We will use .md extension for output
        cmd = ["pdftotext", "-layout", pdf_path, md_path]
        subprocess.run(cmd, check=True, capture_output=True)
        print(f"Converted: {pdf_path} -> {md_path}")
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error converting {pdf_path}: {e}")
        return False
    except FileNotFoundError:
        print("Error: pdftotext not found. Please install poppler-utils or xpdf.")
        return False

def main():
    if not os.path.exists(SOURCE_DIR):
        print(f"Source directory not found: {SOURCE_DIR}")
        print("Please enable access to English.lproj/system.omdocset/System Functions to run this script.")
        return

    ensure_dir(DEST_DIR)

    file_count = 0
    success_count = 0

    print(f"Starting conversion from {SOURCE_DIR} to {DEST_DIR}...")

    for root, dirs, files in os.walk(SOURCE_DIR):
        # Determine relative path to mirror structure
        rel_path = os.path.relpath(root, SOURCE_DIR)
        target_dir = os.path.join(DEST_DIR, rel_path)
        
        ensure_dir(target_dir)

        for file in files:
            if file.lower().endswith(".pdf"):
                file_count += 1
                source_file = os.path.join(root, file)
                # Create destination filename with .md extension
                dest_file = os.path.join(target_dir, os.path.splitext(file)[0] + ".md")

                # Skip if already exists (optional, but good for "don't convert again")
                if os.path.exists(dest_file):
                    print(f"Skipping (already exists): {dest_file}")
                    continue

                if convert_pdf_to_md(source_file, dest_file):
                    success_count += 1

    print(f"\nConversion complete.")
    print(f"Processed {file_count} PDF files.")
    print(f"Successfully converted {success_count} files.")
    print(f"Output directory: {DEST_DIR}")

if __name__ == "__main__":
    main()
