#!/bin/bash
mv $1 .

module load nwchem/6.3
ibrun /opt/apps/intel13/mvapich2_1_9/nwchem/6.3/bin/nwchem water.nw > nwchem_water.out

#Verify if NWChem ran succeesfully
if grep --quiet "Total times" nwchem_water.out; then
  echo NWChem Completed Successfully

  echo "NWChem_Execution_Log=`pwd`/nwchem_water.out"

  exit 0
else
  echo NWChem Execution Failed, Check out and err files
  # Exit with a non-zero exit code so application failure can be detected correctly
  exit 1
fi
