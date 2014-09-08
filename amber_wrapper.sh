#!/bin/sh

mv $1 .
mv $2 .
mv $3 .

module load amber/12.0
ibrun /opt/apps/intel13/mvapich2_1_9/amber/12.0/bin/sander.MPI -O -i 03_Prod.in -o 03_Prod.out -p prmtop -c 02_Heat.rst -r 03_Prod.rst -x 03_Prod.mdcrd -inf 03_Prod.info


#Verify if WRF ran succeesfully
if grep --quiet "Final Performance Info" 03_Prod.info; then
  echo Amber Completed Successfully

  echo "AMBER_Execution_Summary=`pwd`/03_Prod.info"
  echo "AMBER_Trajectory_file=`pwd`/03_Prod.mdcrd"
  echo "AMBER_Execution_log=`pwd`/03_Prod.out"
  echo "AMBER_Restart_file=`pwd`/03_Prod.rst"


  exit 0
else
  echo Amber Execution Failed, Check rsl out and err files
  # Exit with a non-zero exit code so application failure can be detected correctly
  exit 1
fi

