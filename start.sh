#!/bin/bash
exec qemu-system-x86_64 \
  -m 2048 \
  -smp 2 \
  -nographic \
  -serial mon:stdio \
  -hda /vjunos/vjunos.qcow2 \
  -enable-kvm \
  -cpu host \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device e1000,netdev=net0
