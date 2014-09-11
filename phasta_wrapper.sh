#!/bin/sh -x

# Partition
ibrun /work/02422/cwsmith/phastaShared/phastaPartialSlip/build/bin/phNSpre-serial

# Check normal.dat for repeats
ibrun /work/02422/cwsmith/phastaShared/phastaPartialSlip/build/bin/readNChkRep

# Solve
ibrun /work/02422/cwsmith/phastaShared/phastaPartialSlip/build/bin/phastaIC.exe