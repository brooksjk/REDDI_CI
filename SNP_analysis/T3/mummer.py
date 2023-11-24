import matplotlib.pyplot as plt

# Define input file paths
delta_file = "/scratch/jkbrook/BIOE_4510/SNP_analysis/T3/T3.delta"
ref_file = "/scratch/jkbrook/BIOE_4510/SNP_analysis/T3/NC_045512.fa"
query_file = "/scratch/jkbrook/BIOE_4510/SNP_analysis/T3/117M18E552DB0CBD2K.consensus.fa"

# Parse the delta file
with open(delta_file) as f:
    delta_lines = f.readlines()

# Extract the alignment data
ref_start = []
ref_end = []
query_start = []
query_end = []
for line in delta_lines:
    elements = line.strip().split()
    if line.startswith("NUCMER"):
        continue
    elif line.startswith(">"):
        ref, query = elements[0], elements[1]
    else:
        ref_pos, ref_len, query_pos, query_len, _, _, _ = map(int, elements)
        ref_start.append(ref_pos)
        ref_end.append(ref_pos + ref_len)
        query_start.append(query_pos)
        query_end.append(query_pos + query_len)

# Load the reference and query sequences
with open(ref_file) as f:
    ref_seq = f.read().strip()
with open(query_file) as f:
    query_seq = f.read().strip()

# Create a new figure
fig, ax = plt.subplots()

# Plot the reference and query sequences
ax.plot(range(len(ref_seq)), [0]*len(ref_seq), 'k', lw=1, alpha=0.5)
ax.plot(range(len(query_seq)), [1]*len(query_seq), 'k', lw=1, alpha=0.5)

# Plot the alignment regions
for i in range(len(ref_start)):
    ax.plot(range(ref_start[i], ref_end[i]), [0.1]*len(range(ref_start[i], ref_end[i])), 'b', lw=1, alpha=0.5)
    ax.plot(range(query_start[i], query_end[i]), [0.9]*len(range(query_start[i], query_end[i])), 'r', lw=1, alpha=0.5)

# Set the x-axis and y-axis limits and labels
ax.set_xlim(0, len(ref_seq))
ax.set_ylim(0, 1.1)
ax.set_xticks(range(0, len(ref_seq), 10000))
ax.set_xticklabels(range(0, len(ref_seq), 10000))
ax.set_xlabel("Reference position")
ax.set_yticks([0, 0.5, 1])
ax.set_yticklabels(["Reference", "", "Query"])
ax.set_ylabel("Sequence")

# Save the plot
plt.savefig("output.png")



