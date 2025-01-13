###
### python script to check RNASeq strandness
### 
### Difei Wang, 2025-01-10
##
### input file are ReadsPerGene.out.tab from STAR alignment
### 

import os
import sys
import pandas as pd
import glob

# Check if the user provided a directory argument
if len(sys.argv) != 2:
    print("Usage: python script.py <samples_directory>")
    sys.exit(1)

# Get the directory containing the files from the command-line argument
base_dir = sys.argv[1]

# Verify that the directory exists
if not os.path.isdir(base_dir):
    print(f"Error: Directory '{base_dir}' does not exist.")
    sys.exit(1)

# Output summary list
summary = []

# Find all *.ReadsPerGene.out.tab files in the directory
file_pattern = os.path.join(base_dir, "*.ReadsPerGene.out.tab")
file_list = glob.glob(file_pattern)

if not file_list:
    print("No matching files found in the directory.")
    sys.exit(1)

# Process each file
for file_path in file_list:
    # Read the file, skipping header rows
    df = pd.read_csv(file_path, sep='\t', header=None, skiprows=4, names=["GeneID", "Unstranded", "Forward", "Reverse"])
    
    # Calculate total counts for each mode
    total_unstranded = df["Unstranded"].sum()
    total_forward = df["Forward"].sum()
    total_reverse = df["Reverse"].sum()
    
    # Determine strandness
    if total_forward > total_reverse:
        strandness = "Forward-strand-specific"
    elif total_reverse > total_forward:
        strandness = "Reverse-strand-specific"
    else:
        strandness = "Unstranded"
    
    # Add results to summary
    summary.append({
        "File": os.path.basename(file_path),
        "Total_Unstranded": total_unstranded,
        "Total_Forward": total_forward,
        "Total_Reverse": total_reverse,
        "Strandness": strandness
    })

# Convert summary to a DataFrame and save as a CSV
summary_df = pd.DataFrame(summary)
summary_df.to_csv("strandness_summary.csv", index=False)

# Print summary
print(summary_df)

