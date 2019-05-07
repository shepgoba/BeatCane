include $(THEOS)/makefiles/common.mk

FINALPACKAGE = 1
GO_EASY_ON_ME = 0
DEBUG = 0
SHARED_CFLAGS = -fobjc-arc

ARCHS = armv7s armv7 arm64 arm64e
TWEAK_NAME = BeatCane
BeatCane_FILES = BeatCane.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
