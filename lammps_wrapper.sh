#!/bin/sh

mv $1 .

module load lammps/20Mar14
ibrun /opt/apps/intel13/mvapich2_1_9/lammps/20Mar14/bin/lmp_stampede < in.friction

echo "LAMMPS_Simulation_Log=`pwd`/log.lammps"

exit 0
