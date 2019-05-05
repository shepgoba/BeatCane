include $(THEOS)/makefiles/common.mk
ARCHS = armv7s armv7 arm64 arm64e
TWEAK_NAME = BeatCane
BeatCane_FILES = BeatCane.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
