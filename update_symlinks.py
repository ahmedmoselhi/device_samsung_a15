# find vendor -type l | while read link; do   target=$(readlink -f "$link");   echo "$target;SYMLINK=$link"; done > symlinks.txt

# Define file paths
file1_path = 'symlinks.txt'  # Your first file with existing symlink info
file2_path = 'proprietary-files.txt'  # Your second file with list of files
output_path = 'symlinks-proprietary-files.txt'  # Output file

# Read the first file and create a mapping
symlink_map = {}
with open(file1_path, 'r') as f1:
    for line in f1:
        line = line.strip()
        if not line:
            continue
        if ';SYMLINK=' in line:
            filename, symlink_part = line.split(';SYMLINK=', 1)
            symlink_map[filename.strip()] = symlink_part.strip()

# Process the second file and add symlink info
with open(file2_path, 'r') as f2, open(output_path, 'w') as fout:
    for line in f2:
        filename = line.strip()
        if filename in symlink_map:
            # Append the symlink info
            new_line = f"{filename};SYMLINK={symlink_map[filename]}"
        else:
            # No symlink info, keep original
            new_line = filename
        fout.write(new_line + '\n')

print(f"Updated file saved as {output_path}")