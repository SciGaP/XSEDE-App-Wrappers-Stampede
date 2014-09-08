#!/bin/bash
mv $1 .
mv $2 .

module load espresso/5.0.3
ibrun /opt/apps/intel13/mvapich2_1_9/espresso/5.0.3/bin/pw.x < Al.sample.in > Al.sample.out

#Verify if ESPRESSO ran succeesfully
if grep --quiet "JOB DONE" Al.sample.out; then
  echo ESPRESSO Completed Successfully

  echo "ESPRESSO_Execution_Log=`pwd`/Al.sample.out"
  echo "ESPRESSO_WFC_Binary_file =`pwd`/Al_exc3.wfc1"

  exit 0
else
  echo ESPRESSO Execution Failed, Check out and err files
  # Exit with a non-zero exit code so application failure can be detected correctly
  exit 1
fi
