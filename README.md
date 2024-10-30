# quick-dna
repository to setup oakvar and dna-seq modules quicker

## setup

This repository uses [micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html) to manage the dependencies.

You can also use anaconda, but micromamba is faster and more lightweight.

Everything should work on linux, MacOS or windows, however I only tested on linux.

The following instructions are on Linux or MacOS, for Windows you can run foollowing commands after installing WSL2 with Ubuntu 24.04. 
It can also work without WSL2 on plain Windows, however the commands will be different.

In case if you have any issues with micromamaba on Windows you can use other environments, for example anaconda, miniforge, pixi or poetry, however the configuration will be a bit different.

Install micromamba:

```bash
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
```

Install the dependencies:

```bash
micromamba create -f environment.yaml
```

Note: if you use anaconda it can be:
```bash
conda env create -f environment.yaml
```
All other commands are the same.

Now you can activate the environment.
Within the activated environment you can run oakvar.
We arleady prepared setup.yaml file that you can use to install all the modules.
One of them (dbsnp) is huge, so it will take a while to download.

```bash
micromamba activate quick-dna
ov setup
```
It will ask you to signin or signup to the OakVar store (it is free, just email and password is required).

If you want to install with all just-dna-seq modules and their dependencies use setup.yaml

```bash
ov system setup -f setup.yaml
```

Installation can take a while and a lot of space as we depend on dbsnp database which is huge.

After installation you can run oakvar: gui with

```bash
ov gui --multiuser --port 8000
```

By default it runs on port 8000. You can open localhost:8000 in your browser.

Please, check OakVar [documentation](https://rkimoakbioinformatics.github.io/oakvar/overview/) or Just-DNA-Seq [documentation](https://just-dna-seq.readthedocs.io/en/latest/) for more details.


## Module development

If you want to develop your own module, please, check [this](https://rkimoakbioinformatics.github.io/oakvar/devguide_modules/) page.

You can use vcf file from data/longevity_snps_1000genom.vcf as an example input.



## Learn More

For a comprehensive overview of the Just-DNA-Seq platform and its capabilities in personal genomics and longevity science, check out our research paper: ["Just-DNA-Seq, open-source personal genomics platform: longevity science for everyone"](https://arxiv.org/abs/2403.19087).