#!/bin/bash
# Helpful to read outpus when debugging
set -x

# load variables
source "/etc/libvirt/hooks/kvm.conf"

# Stop display manager
systemctl stop sddm.service

# Unbind VTconsoles
for i in /sys/class/vtconsole/*
do
  echo 0 > $i/bind
done

# Unbind EFI-Framebuffer
echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Avoid a Race condition by waiting 7 seconds. This can be calibrated to be shorter or longer if required for your system
sleep 7

# Unload Nvidia
modprobe -r nvidia_drm
modprobe -r nvidia_modeset
modprobe -r drm_kms_helper
modprobe -r nvidia
modprobe -r i2c_nvidia_gpu
modprobe -r drm
modprobe -r nvidia_uvm

# unbind gpu
virsh nodedev-detach $VIRSH_GPU_VIDEO
virsh nodedev-detach $VIRSH_GPU_AUDIO
virsh nodedev-detach $VIRSH_GPU_USB1
virsh nodedev-detach $VIRSH_GPU_USB2

# load vfio
modprobe vfio
modprobe vfio_pci
modprobe vfio_iommu_type1
