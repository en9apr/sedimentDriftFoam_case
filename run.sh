#!/bin/sh

cd 00_simpleFoam

rm -rf 0

rm log.*

cp -rf 0_orig 0

decomposePar > log.decomposePar 2>&1

mpirun -np 8 simpleFoam -parallel > log.simpleFoam 2>&1

reconstructPar > log.reconstructPar 2>&1

pyFoamCopyLastToFirst.py . . > log.pyFoamCopyLastToFirst

pyFoamClearCase.py . --processors-remove --keep-postprocessing > log.pyFoamClearCase

cd ..

cp -rf 00_simpleFoam 01_sedimentTransportFoam

cd 01_sedimentTransportFoam

cp constant/sedimentProperties_1 constant/sedimentProperties

decomposePar > log.decomposePar 2>&1

mpirun -np 8 sedimentDriftFoam -parallel > log.sedimentDriftFoam 2>&1

reconstructPar > log.reconstructPar 2>&1

pyFoamCopyLastToFirst.py . . > log.pyFoamCopyLastToFirst

pyFoamClearCase.py . --processors-remove --keep-postprocessing > log.pyFoamClearCase

cd ..

cp -rf 00_simpleFoam 02_sedimentTransportFoam

cd 02_sedimentTransportFoam

cp constant/sedimentProperties_2 constant/sedimentProperties

decomposePar > log.decomposePar 2>&1

mpirun -np 8 sedimentDriftFoam -parallel > log.sedimentDriftFoam 2>&1

reconstructPar > log.reconstructPar 2>&1

pyFoamCopyLastToFirst.py . . > log.pyFoamCopyLastToFirst

pyFoamClearCase.py . --processors-remove --keep-postprocessing > log.pyFoamClearCase

cd ..

cp -rf 00_simpleFoam 03_sedimentTransportFoam

cd 03_sedimentTransportFoam

cp constant/sedimentProperties_3 constant/sedimentProperties

decomposePar > log.decomposePar 2>&1

mpirun -np 8 sedimentDriftFoam -parallel > log.sedimentDriftFoam 2>&1

reconstructPar > log.reconstructPar 2>&1

pyFoamCopyLastToFirst.py . . > log.pyFoamCopyLastToFirst

pyFoamClearCase.py . --processors-remove --keep-postprocessing > log.pyFoamClearCase

cd ..

cp -rf 00_simpleFoam 04_sedimentTransportFoam

cd 04_sedimentTransportFoam

cp constant/sedimentProperties_4 constant/sedimentProperties

decomposePar > log.decomposePar 2>&1

mpirun -np 8 sedimentDriftFoam -parallel > log.sedimentDriftFoam 2>&1

reconstructPar > log.reconstructPar 2>&1

pyFoamCopyLastToFirst.py . . > log.pyFoamCopyLastToFirst

pyFoamClearCase.py . --processors-remove --keep-postprocessing > log.pyFoamClearCase

cd ..

cp -rf 01_sedimentTransportFoam 05_collation

cp 05_collation/0/C 05_collation/0/C1

cp 02_sedimentTransportFoam/0/C 05_collation/0/C2

cp 03_sedimentTransportFoam/0/C 05_collation/0/C3

cp 04_sedimentTransportFoam/0/C 05_collation/0/C4

cd 05_collation

postProcess -func "add(C1, C2, C3, C4)" > log.add 2>&1

postProcess -func sampleDictConcentration > log.sampleConcentration 2>&1
