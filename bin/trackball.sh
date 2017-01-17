#!/bin/sh

device='Logitech USB Trackball'

xinput set-button-map "${device}" 1 9 3 4 5 6 7 8 2

xinput --set-prop "${device}" 'Evdev Wheel Emulation'         1
xinput --set-prop "${device}" 'Evdev Wheel Emulation Axes'    6, 7, 4, 5
xinput --set-prop "${device}" 'Evdev Wheel Emulation Inertia' 20
xinput --set-prop "${device}" 'Evdev Wheel Emulation Timeout' 0
xinput --set-prop "${device}" 'Evdev Wheel Emulation Button'  8

#xinput set-prop "${device}" 'Device Accel Profile'               2
#xinput set-prop "${device}" 'Device Accel Constant Deceleration' 1.2
#xinput set-prop "${device}" 'Device Accel Adaptive Deceleration' 32.0
#xinput set-prop "${device}" 'Device Accel Velocity Scaling'      4.0

# xset m 3/1 64
# acceleration:  3/1    threshold:  64
#xinput set-ptr-feedback "${device}" 64 3 1
