
#!/bin/bash
set -x

# load variables
source "/etc/libvirt/hooks/kvm.conf"

# unload vfio-pci
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

# Re-Bind GPU to Nvidia Driver
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO
virsh nodedev-reattach $VIRSH_GPU_USB1
virsh nodedev-reattach $VIRSH_GPU_USB2

# Rebind VT consoles

for i in /sys/class/vtconsole/*
do
  echo 1 > $i/bind     
done

# read nvidia x config
# nvidia-xconfig --query-gpu-info > /dev/null 2>&1

# Bind EFI-framebuffer
echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# load drivers
modprobe nvidia_drm
modprobe nvidia_modeset
modprobe drm_kms_helper
modprobe nvidia
modprobe drm
modprobe nvidia_uvm

# Restart Display Manager
systemctl start sddm.service
