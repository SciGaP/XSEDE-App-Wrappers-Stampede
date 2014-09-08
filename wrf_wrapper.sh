mv $1 $2 $3 .

#Copy the Static Table files
cp /home1/01437/ogce/apps/wrf3.5.1/WRFV3/run/RRTM_DATA ./
cp /home1/01437/ogce/apps/wrf3.5.1/WRFV3/run/GENPARM.TBL ./
cp /home1/01437/ogce/apps/wrf3.5.1/WRFV3/run/MPTABLE.TBL ./
cp /home1/01437/ogce/apps/wrf3.5.1/WRFV3/run/VEGPARM.TBL ./
cp /home1/01437/ogce/apps/wrf3.5.1/WRFV3/run/LANDUSE.TBL ./
cp /home1/01437/ogce/apps/wrf3.5.1/WRFV3/run/SOILPARM.TBL ./
#cp /home1/01437/ogce/case_studies/* .
module load netcdf

ibrun /home1/01437/ogce/apps/wrf3.5.1/WRFV3/main/wrf.exe

#Verify if WRF ran succeesfully
if grep --quiet "SUCCESS COMPLETE WRF" rsl.out.0000; then
  echo WRF Completed Successfully

  echo "WRF_Output=`pwd`/wrfout_d01_2000-01-24_12:00:00"
  echo "WRF_Execution_Log=`pwd`/rsl.out.0000"

  exit 0
else
  echo WRF Execution Failed, Check rsl out and err files
  # Exit with a non-zero exit code so application failure can be detected correctly
  exit 1
fi

