# Python Research Environment Container

A reproducible and portable Python environment for scientific research, including:

* Molecular Dynamics (MD) trajectory analysis
* Structural biology
* Cheminformatics
* Data science
* Machine learning
* Scientific visualization
* Research automation and document processing

This container is designed for both local development environments and HPC systems where Docker is unavailable by using **Apptainer/Singularity**.

---

# Overview

Scientific Python environments often become difficult to maintain due to complex dependencies between packages.

This container provides a reproducible environment based on:

* Python 3.11
* micromamba
* conda-forge packages
* Docker / GitHub Container Registry
* Apptainer / Singularity compatibility

The container can be used consistently across:

* personal workstations
* research servers
* HPC clusters
* CI/CD workflows

---

# Main Features

## Molecular Dynamics and Structural Biology

Included tools:

* MDAnalysis
* MDTraj
* AmberTools
* Biopython
* Gemmi
* FreeSASA
* ProLIF

Supported analyses include:

* RMSD
* RMSF
* Radius of gyration
* PCA
* clustering
* contact analysis
* SASA calculation
* protein-ligand interaction analysis
* PDB/mmCIF processing

---

## Cheminformatics

Included tools:

* RDKit
* Open Babel

Capabilities:

* molecular structure handling
* SMILES processing
* molecular descriptors
* ligand preparation
* format conversion

---

## Scientific Computing

Included libraries:

* NumPy
* SciPy
* pandas
* xarray
* h5py
* pyarrow

Capabilities:

* numerical analysis
* large-scale data processing
* scientific data storage
* Parquet/Arrow workflows

---

## Machine Learning and Statistics

Included libraries:

* scikit-learn
* statsmodels
* UMAP-learn

Capabilities:

* dimensionality reduction
* clustering
* regression analysis
* statistical modeling

---

## Visualization

Included libraries:

* matplotlib
* seaborn
* Plotly
* Altair
* Pillow

Suitable for:

* publication-quality figures
* interactive plots
* trajectory analysis visualization
* data exploration

---

## Data Processing and Automation

Included libraries:

### File formats

* openpyxl
* lxml
* pyyaml

### Web/API

* requests
* httpx

### Document processing

* pypdf
* pdfplumber
* python-docx
* python-pptx
* reportlab

Examples:

* extracting information from papers
* generating automated reports
* creating Excel/PowerPoint outputs

---

## Development Environment

Included tools:

* JupyterLab
* IPython
* pytest
* black
* ruff
* mypy
* pre-commit

The environment can also be used as a general Python development container.

---

# Repository Structure

```text
.
├── Dockerfile
├── environment.yml
├── README.md
└── .github
    └── workflows
        └── build.yml
```

---

# Build Workflow

The GitHub Actions workflow automatically performs:

1. Docker image build
2. Dependency validation
3. Import smoke test
4. Push to GitHub Container Registry

The smoke test verifies that major scientific packages can be imported successfully.

---

# Container Image

The published image is available at:

```bash
ghcr.io/tomoki-ueda-cybersec/python-research-env:latest
```

---

# Pulling the Container

## Docker

```bash
docker pull ghcr.io/tomoki-ueda-cybersec/python-research-env:latest
```

---

## Apptainer

```bash
apptainer pull docker://ghcr.io/tomoki-ueda-cybersec/python-research-env:latest
```

---

## Singularity

```bash
singularity pull docker://ghcr.io/tomoki-ueda-cybersec/python-research-env:latest
```

---

# Running the Container

## Docker

Start an interactive shell:

```bash
docker run -it \
    -v $(pwd):/workspace \
    ghcr.io/tomoki-ueda-cybersec/python-research-env:latest
```

Run a Python script:

```bash
docker run --rm \
    -v $(pwd):/workspace \
    ghcr.io/tomoki-ueda-cybersec/python-research-env:latest \
    python /workspace/script.py
```

---

## Apptainer / Singularity

Open a shell:

```bash
apptainer shell python-research-env_latest.sif
```

Run Python:

```bash
apptainer exec \
    python-research-env_latest.sif \
    python script.py
```

Use local files:

```bash
apptainer exec \
    --bind $(pwd):/workspace \
    python-research-env_latest.sif \
    python /workspace/script.py
```

---

# Example Usage

## MD trajectory analysis

```python
import MDAnalysis as mda

u = mda.Universe(
    "topology.prmtop",
    "trajectory.nc"
)

print(u)
```

---

## Data analysis

```python
import pandas as pd

df = pd.read_csv("data.csv")

print(df.describe())
```

---

## Machine learning

```python
from sklearn.decomposition import PCA

pca = PCA(n_components=2)

result = pca.fit_transform(data)
```

---

## PDF text extraction

```python
from pypdf import PdfReader

reader = PdfReader("paper.pdf")

text = reader.pages[0].extract_text()

print(text)
```

---

# Updating the Environment

To add or modify packages:

1. Edit

```text
environment.yml
```

2. Commit changes

3. Push to GitHub

GitHub Actions will automatically rebuild and publish the updated container.

---

# Versioning

Images are tagged with:

* `latest`
* Git commit SHA
* Git release tags

Example:

```bash
ghcr.io/tomoki-ueda-cybersec/python-research-env:v1.0.0
```

Using a fixed version tag allows exact reproduction of previous analyses.

---

# Recommended Workflow

```text
Research Code
      |
      v
GitHub Repository
      |
      v
GitHub Actions
      |
      v
Build Container
      |
      v
Run Tests
      |
      v
Push to GHCR
      |
      v
Apptainer/Singularity Pull
      |
      v
HPC Analysis Environment
```

---

# License

This repository is released under the MIT License.

Individual software packages included in this container remain subject to their respective licenses.

