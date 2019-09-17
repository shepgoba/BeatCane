include $(THEOS)/makefiles/common.mk

FINALPACKAGE = 1
DEBUG = 0

ARCHS = arm64 arm64e
TWEAK_NAME = BeatCane
BeatCane_FILES = BeatCane.xm
SHARED_CFLAGS += -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
