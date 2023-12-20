#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 48:00:00
#SBATCH --mem-per-cpu=1000M
#SBATCH -p RM-shared
#SBATCH --mail-type=END
#SBATCH --mail-user=hanchen2@andrew.cmu.edu
#SBATCH -o job.out
#SBATCH --job-name=random2

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
 
# Variables
export ESPRESSO_PSEUDO=/jet/home/hzhao3/pseudopotential
# export PWtools=/jet/home/sgodse/softwares/qe-7.0/PW/tools
# export PPtools=/jet/home/sgodse/softwares/qe-7.0/PP/tools
export TMP_DIR=/ocean/projects/cts180021p/hzhao3/CFx2022
export I_MPI_JOB_RESPECT_PROCESS_PLACEMENT=0
export ASE_ESPRESSO_COMMAND="pw.x < CFx.pwi > out.pwo"
 
## Currently Loaded Modules:
#  1) nvhpc/21.2   3) scalapack/2.1.0   5) openmpi/4.0.2-intel20.4     7) openblas/0.3.13-intel20.4
#  2) fftw/3.3.8   4) allocations/1.0   6) QuantumEspresso/6.7-intel   8) intel/20.4
 
echo "Job started on `hostname` at `date`"
mpirun -np $SLURM_NTASKS pw.x < CF.pwi > out.pwo
echo " "
echo "Job Ended at `date`"