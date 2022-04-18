#!/bin/bash
# Helpful to read outpus when debugging
set -x

# load variables
source "/etc/libvirt/hooks/kvm.conf"

#detach usb card
virsh nodedev-detach $VIRSH_USB_CARD

# load vfio
modprobe vfio
modprobe vfio_pci
modprobe vfio_iommu_type1
