# 🧠 Brain Vascular snRNA-seq Hackathon Dataset

**Dataset summary**

| Feature | Details |
|----------|----------|
| Tissue | Dorsolateral prefrontal cortex |
| Conditions | Normal / Alzheimer disease / Cognitive disorder |
| Donors | 10 per group |
| Cells | 10,216 nuclei × 31,460 genes |
| Assay | 10x Multiome snRNA-seq |
| Format | `.h5ad` (for Python/Scanpy) and `.csv` (for R/Seurat) |

---

## 🚀 Quick Start for Participants

### Option A — Seurat (R)
Unzip `brain_vascular_dataset.zip` and open R:

```r
library(Seurat)
library(ggplot2)

counts <- read.csv("brain_vascular_for_Seurat/X.csv", row.names = 1, check.names = FALSE)
meta   <- read.csv("brain_vascular_for_Seurat/obs.csv", row.names = 1, check.names = FALSE)

brain <- CreateSeuratObject(counts = counts, meta.data = meta)
brain <- NormalizeData(brain)
brain <- FindVariableFeatures(brain)
brain <- ScaleData(brain)
brain <- RunPCA(brain)
brain <- RunUMAP(brain, dims = 1:15)

DimPlot(brain, group.by = "cell_type", label = TRUE) + ggtitle("Brain vascular cells")
