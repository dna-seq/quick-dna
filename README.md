# quick-dna
Repository to setup OakVar and DNA-seq modules quicker

## Setup

This repository uses [micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html) to manage dependencies.

> **Note**: While Anaconda can also be used, micromamba is recommended as it's faster and more lightweight.

### System Compatibility
- Fully tested on Linux
- Should work on MacOS and Windows
- Windows users have two options:
  1. Recommended: Install WSL2 with Ubuntu 24.04 and follow Linux instructions
  2. Use native Windows (commands will differ)

### Installation Steps

1. Install micromamba:
```bash
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
```

2. Install dependencies:
```bash
micromamba create -f environment.yaml
```

> **Alternative**: If using Anaconda:
```bash
conda env create -f environment.yaml
```

3. Install OakVar modules:

**Full installation** (includes all just-dna-seq modules):
```bash
micromamba activate quick-dna
ov system setup -f setup.yaml
```
*Note: The dbsnp module is large and may take significant time to download.*

**Minimal installation**:
```bash
micromamba activate quick-dna
ov setup
```
*Note: You'll need to create a free account (email + password) on the OakVar store.*

## Usage

Start the OakVar GUI:
```bash
ov gui --multiuser --port 8000
```
Then access the interface at `http://localhost:8000`

## Documentation
- [OakVar Documentation](https://rkimoakbioinformatics.github.io/oakvar/overview/)
- [Just-DNA-Seq Documentation](https://just-dna-seq.readthedocs.io/en/latest/)

## Module Development
- [Module Development Guide](https://rkimoakbioinformatics.github.io/oakvar/devguide_modules/)
- Sample input file available at: `data/longevity_snps_1000genom.vcf`

## Learn More
Read our research paper: ["Just-DNA-Seq, open-source personal genomics platform: longevity science for everyone"](https://arxiv.org/abs/2403.19087)