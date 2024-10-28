# quick-dna
repository to setup oakvar and dna-seq modules quicker

## setup

This repository uses [micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html) to manage the dependencies.

You can also use anaconda, but micromamba is faster and more lightweight.

Everything should work on linux, macos or windows, however I only tested on linux.

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

```bash
micromamba activate quick-dna
ov setup
```
It will ask you to signin or signup to the OakVar store (it is free, just email and password is required).

If you want to install with all just-dna-seq modules and their dependencies use setup.yaml

```bash
ov setup -f setup.yaml
```

Installation can take a while and a lot of space as we depend on dbsnp database which is huge.

After installation you can run:

```bash
ov --help
```

