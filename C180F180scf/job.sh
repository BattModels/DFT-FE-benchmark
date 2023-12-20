#!/bin/bash
#SBATCH -N 2
#SBATCH -n 256
#SBATCH -t 48:00:00
#SBATCH --mem-per-cpu=1500M
#SBATCH -p RM
#SBATCH --job-name=C180F180
#SBATCH --error=job.err
#SBATCH --output=job.out

#modules
module purge
module load intel/20.4
module load openmpi/4.0.2-intel20.4
module load intelmpi/20.4-intel20.4
module load fftw/3.3.8
module load scalapack/2.1.0
module load openblas/0.3.13-intel20.4
module load allocations/1.0
module load intelmpi/2021.3.0-intel2021.3.0
module load QuantumEspresso/7.0-intel

echo "Job started on `hostname` at `date`"
mpirun -np $SLURM_NTASKS pw.x < input > output
echo " "
echo "Job Ended at `date`"