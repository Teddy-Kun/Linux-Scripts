#!/bin/bash
pactl load-module module-null-sink sink_name=Virtual1
pactl load-module module-loopback source=alsa_input.usb-Solid_State_System_Co._Ltd._LCS_USB_Audio_000000000000-00.mono-fallback sink=Virtual1
pactl load-module module-loopback source=Virtual1.monitor sink=alsa_output.pci-0000_0a_00.4.analog-stereo
