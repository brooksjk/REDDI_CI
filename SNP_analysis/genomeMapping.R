library(Biostrings)
library(GenomicRanges)
library(ggplot2)

# Load reference genome and query genome
ref_genome <- readDNAStringSet("/scratch1/jkbrook/BIOE_4510/SNP_analysis/NC_045512.fa")
sample_seq <- readDNAStringSet("/scratch1/jkbrook/BIOE_4510/SNP_analysis/T1/117M18E37DBC9AD1KM.consensus.fa")

# Create pairwise alignment between reference and sample sequences
aln <- PairwiseAlignment(ref_genome, sample_seq)

# Extract aligned regions and alignment coordinates
ref_aligned <- ref_genome[subjectHits(aln)[[1]]]
query_aligned <- sample_seq[queryHits(aln)[[1]]]
ref_start <- attr(qstart(aln), "start")
ref_end <- attr(qend(aln), "start")

# Identify mutations and SNPs
mutations <- ref_aligned != query_aligned
snps <- mutations & ref_aligned != "-" & query_aligned != "-"

# Create data frame for plotting
plot_data <- data.frame(
  x = as.numeric(ref_start:ref_end),
  y = as.character(ref_aligned),
  mutation = mutations,
  snp = snps
)

# Create plot
ggplot(plot_data, aes(x, y, fill=mutation, color=snp)) + 
  geom_tile() + 
  scale_fill_manual(values=c("white", "red")) +
  scale_color_manual(values=c("black", "blue")) +
  theme_void()


















