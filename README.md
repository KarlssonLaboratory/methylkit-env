[![Build and Deploy Docker Container](https://github.com/KarlssonLaboratory/methylkit-env/actions/workflows/build-and-deploy.yml/badge.svg)](https://github.com/KarlssonLaboratory/methylkit-env/actions/workflows/build-and-deploy.yml)

A Bioconductor [3.19](https://bioconductor.org/news/bioc_3_19_release/) Docker container built on [methylKit](https://github.com/al2na/methylKit) for differential DNA methylation analysis, including R-packages for genomic annotation, pathway enrichment, publication-quality figures and Quarto for generating reports.

> [!NOTE]
> Every push to `main` automatically builds and pushes the image to GitHub Container Registry. Tagged releases (e.g. `v1.0.0`) produce versioned image tags.

<details>
	<summary>Included R-packages</summary>

+ **Differential methylation**: methylKit
+ **Genomic annotations**: 
	+ BSgenome.Hsapiens.UCSC.hg38/mm39
	+ org.Mm/Hs.eg.db
	+ genomation
	+ GenomicRanges
	+ [TxDb.Mmusculus.UCSC.mm39.knownGene](https://bioconductor.org/packages//release/data/annotation/html/TxDb.Mmusculus.UCSC.mm39.knownGene.html), provides genomic regions annotations (exon, intron, promoter, CpG-island etc),
	+ [ChIPseeker](https://github.com/YuLab-SMU/ChIPseeker), finds the nearest gene around a peak/position
+ **Pathway enrichment**:
	+ biomaRt
	+ clusterProfiler
+ **Visualisation**:
	+ ggrepel
	+ ggvenn
	+ RColorBrewer
	+ cowplot
	+ ggsignif
	+ patchwork
	+ pheatmap
	+ ComplexHeatmap
	+ gt
	+ DT
+ Other core dependencies:
	+ tidyverse
	+ gtools
	+ scales
	+ data.table
	+ openxlsx
	+ tximport
</details>

## Pull the container

```sh
# As docker
docker pull ghcr.io/karlssonlaboratory/methylkit-env:63c37f4

# As apptainer
apptainer pull docker://ghcr.io/karlssonlaboratory/methylkit-env:63c37f4

# As singularity
singularity pull docker://ghcr.io/karlssonlaboratory/methylkit-env:63c37f4
```

## Run interactively

```sh
docker run -it --rm -v $(pwd):/data ghcr.io/karlssonlaboratory/methylkit-env:63c37f4
```

## Build locally

```sh
git clone https://github.com/karlssonlaboratory/methylkit-env:63c37f4.git
cd variant_call
docker build -t variant_call .
```

<details>
  <summary>As nextflow process</summary>

```groovy
process PROCESS_NAME {
	
	. . .

	container "${workflow.containerEngine == 'singularity' ?
		'docker://ghcr.io/karlssonlaboratory/methylkit-env:63c37f4' :
		'ghcr.io/karlssonlaboratory/methylkit-env:63c37f4'}"

	. . .
}
```

The container definition uses an [elvis operator](https://www.nextflow.io/docs/latest/reference/syntax.html#unary-expressions) = `<statement> ? <TRUE> : <FALSE>`
</details>
