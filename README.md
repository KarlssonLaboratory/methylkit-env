[![Build and Deploy Docker Container](https://github.com/KarlssonLaboratory/methylkit-env/actions/workflows/build-and-deploy.yml/badge.svg)](https://github.com/KarlssonLaboratory/methylkit-env/actions/workflows/build-and-deploy.yml)

A bioconductor/bioconductor_docker:[RELEASE_3_19](https://bioconductor.org/news/bioc_3_19_release/) container with the R-package [methylKit](https://github.com/al2na/methylKit) and some dependencies to analyse differential methylation.

> [!NOTE]
> Every push to `main` automatically builds and pushes the image to GitHub Container Registry. Tagged releases (e.g. `v1.0.0`) produce versioned image tags.

<details>
	<summary>Included softwares</summary>

+ tidyverse
+ gt
+ DT
+ gtools
+ scales
+ data.table
+ ggrepel
+ ggvenn
+ RColorBrewer
+ cowplot
+ ggsignif
+ openxlsx
+ patchwork
+ methylKit
+ genomation
+ GenomicRanges
+ clusterProfiler
+ tximport
+ biomaRt
+ ComplexHeatmap
+ BSgenome.Hsapiens.UCSC.hg38
+ BSgenome.Mmusculus.UCSC.mm39
+ org.Mm.eg.db
+ org.Hs.eg.db
</details>

## Pull the container

```sh
# As docker
docker pull ghcr.io/karlssonlaboratory/methylkit-env:4da78ad

# As apptainer
apptainer pull docker://ghcr.io/karlssonlaboratory/methylkit-env:4da78ad

# As singularity
singularity pull docker://ghcr.io/karlssonlaboratory/methylkit-env:4da78ad
```

## Run interactively

```sh
docker run -it --rm -v $(pwd):/data ghcr.io/karlssonlaboratory/methylkit-env:4da78ad
```

## Build locally

```sh
git clone https://github.com/karlssonlaboratory/methylkit-env:4da78ad.git
cd variant_call
docker build -t variant_call .
```

<details>
  <summary>As nextflow process</summary>

```groovy
process PROCESS_NAME {
	
	. . .

	container "${workflow.containerEngine == 'singularity' ?
		'docker://ghcr.io/karlssonlaboratory/methylkit-env:4da78ad' :
		'ghcr.io/karlssonlaboratory/methylkit-env:4da78ad'}"

	. . .
}
```

The container definition uses an [elvis operator](https://www.nextflow.io/docs/latest/reference/syntax.html#unary-expressions) = `<statement> ? <TRUE> : <FALSE>`
</details>
