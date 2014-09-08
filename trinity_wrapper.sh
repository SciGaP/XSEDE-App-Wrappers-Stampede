#!/bin/bash
mv $1 .
mv $2 .

module swap intel gcc/4.7.1
module load bowtie/1.0.0
module load trinityrnaseq/r20130225

/opt/apps/trinityrnaseq/r20130225/Trinity.pl --seqType fq --JM 2G --left reads.left.fq --right reads.right.fq --SS_lib_type RF --CPU 4 --bflyHeapSpaceMax 2G --output ./

echo "Trinity_Execution_Log=`pwd`/Trinity.timing"
echo "Trinity_FASTA_File=`pwd`/Trinity.fasta"

