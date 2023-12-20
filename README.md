# DFT-FE-benchmark
Repository for running DFT-FE benchmark simulations. 

## Adding New Benchmarks
For clarity, please create your own branch for benchmarking simulations of your interest, and open a [pull request](https://github.com/BattModels/DFT-FE-benchmark/pulls) to add it. The branch should be ideally named after your name (e.g. branch Hancheng). Each branch can contain multiple benchmarks that are crucial for you in deciding whether or not you want to use DFT-FE. If multiple benchmarks are added, please separate them into different folders, so ideally each folder contains only one system/simulation of interest. The folder should contain all necessary information needed for running a DFT simulation. For example, if you want to benchmark against Quantum Espresso, the folder should contain the following:
```
- benchmarks
    + simulation-to-benchmark-against-QE/
        - input.pwi # Quantum Espresso input script
        - *.upf # Pseudopotential files needed for the simulation
        - run.sh # Shell file used for submitting the job, containing the environment specifications if necessary
        - info.yml # optional, information describing the simulation and what you want to achieve with this
        - output.pwo # optional (but highly recommended!), the output file to compare result accuracy
        - other-relative-scripts-or-environment-setups
```
In addition, if you want to benchmark against gpaw, the folder should contain the following:
```
- benchmarks
    + simulation-to-benchmark-against-gpaw/
        - run.py # python script for running gpaw
        - structure.xyz # structures that are needed for running the simulation (not necessarily in xyz format, could be any format as long as it contains the structure information needed)
        - run.sh # Shell file used for submitting the job
        - env.yml # Environment setup for gpaw
        - info.yml # optional, information describing the simulation and what you want to achieve with this
        - output-files # optional (but highly recommended!), the output file to compare result accuracy
        - other-relative-scripts-or-environment-setups
        
```

Since DFT-FE is designed and optimized for large-scale simulations (for systems with thousands of electrons), it is recommended to include benchmark simulations at this scale if it is relevant to your research.

## Running Benchmarks
Depending on the installation progress, we might run the benchmarks on either bridges2 or h001. All the benchmarks will ideally be run on GPUs unless not possible to do so. The output and results will be put in the same folder as the input for comparison.