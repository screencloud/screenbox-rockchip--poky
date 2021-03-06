require xf86-input-common.inc

SUMMARY = "X.Org X server -- keyboard input driver"

DESCRIPTION = "keyboard is an Xorg input driver for keyboards. The \
driver supports the standard OS-provided keyboard interface.  The driver \
functions as a keyboard input device, and may be used as the X server's \
core keyboard."

SRCREV = "3e28d68b50d291938734e9684b8296ca864f3892"
PV = "1.3.2+git${SRCPV}"

SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-keyboard;protocol=git"
S = "${WORKDIR}/git"

