#!/bin/bash
set -e;

if [ -f /workspace/cache/qemu-2.9.0-compiled.tar.gz ]; then

  echo "Downloading QEMU source code...";
  wget http://download.qemu-project.org/qemu-2.9.0.tar.xz;

  echo "Extracting QEMU...";
  tar xvJf qemu-2.9.0.tar.xz -C /workspace;

  echo "Entering QEMU directory...";
  cd /workspace/qemu-2.9.0;

  echo "Configuring QEMU...";
  ./configure;

  echo "Building QEMU...";
  make;
  
  echo "Compressing built qemu...";
  tar -zcvf /workspace/qemu-2.9.0-compiled.tar.gz /workspace/qemu-2.9.0;
  
  echo "Moving compressed qemu to cache...";
  mv qemu-2.9.0-compiled.tar.gz /workspace/cache/;
  
else

  echo "Restoring compressed qemu from cache...";
  tar -xvzf /workspace/cache/qemu-2.9.0-compiled.tar.gz -C /workspace;

fi;
