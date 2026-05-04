#!/usr/bin/env Rscript

dt_version <- "1.16.4"

#---- 1. Pin data.table FIRST (before anything else can pull in 1.17+) ----
# methylKit is incompatible with data.table >= 1.17
# See: https://github.com/al2na/methylKit/issues/350

if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes", repos = "https://cloud.r-project.org")
}
remotes::install_version(
  "data.table",
  version = dt_version,
  repos = "https://cloud.r-project.org",
  upgrade = "never"
)


#---- 2. CRAN packages ----

pkgs_CRAN <- c(
  "tidyverse",
  "gt",
  "DT",
  "gtools",
  "scales",
  "ggrepel",
  "ggvenn",
  "RColorBrewer",
  "cowplot",
  "ggsignif",
  "openxlsx",
  "patchwork"
)

install.packages(
  pkgs_CRAN,
  repos = "https://cloud.r-project.org",
  Ncpus = parallel::detectCores()
)


#---- 3. Bioconductor packages ----

pkgs_Bioc <- c(
  "methylKit",
  "genomation",
  "GenomicRanges",
  "clusterProfiler",
  "tximport",
  "biomaRt",
  "ComplexHeatmap",
  "BSgenome.Hsapiens.UCSC.hg38",
  "BSgenome.Mmusculus.UCSC.mm39",
  "org.Mm.eg.db",
  "org.Hs.eg.db"
)

BiocManager::install(
  pkgs_Bioc,
  ask = FALSE,
  update = FALSE,
  Ncpus = parallel::detectCores()
)


#---- 4. Verify everything installed and data.table is still pinned ----

all_pkgs <- c(pkgs_CRAN, pkgs_Bioc, "data.table")
missing <- all_pkgs[!all_pkgs %in% installed.packages()[, "Package"]]
if (length(missing)) {
  stop("Failed to install: ", paste(missing, collapse = ", "))
}

ver <- as.character(packageVersion("data.table"))
if (ver != dt_version) {
  stop(
    "data.table was upgraded to ",
    ver,
    " — methylKit will break. Check install order."
)}

cat("All packages installed successfully.\n")
cat("data.table version:", dt_version, "(pinned)\n")