# load_brain_vascular.R
# Quick-start Seurat script for hackathon participants

library(Seurat)
library(ggplot2)

counts <- read.csv("brain_vascular_for_Seurat/X.csv", row.names = 1, check.names = FALSE)
meta   <- read.csv("brain_vascular_for_Seurat/obs.csv", row.names = 1, check.names = FALSE)

brain <- CreateSeuratObject(counts = counts, meta.data = meta)
brain[["percent.mt"]] <- PercentageFeatureSet(brain, pattern = "^MT-")

# Basic QC plots
VlnPlot(brain, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)

# Standard workflow
brain <- NormalizeData(brain)
brain <- FindVariableFeatures(brain)
brain <- ScaleData(brain)
brain <- RunPCA(brain)
brain <- RunUMAP(brain, dims = 1:15)
DimPlot(brain, group.by = "cell_type", label = TRUE)
