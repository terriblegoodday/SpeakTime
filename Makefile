THEOS_DEVICE_IP=10.0.0.104
DEBUG = 1
FINALPACKAGE = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpotlightActivator
SpotlightActivator_FILES = Tweak.xm
SpotlightActivator_FRAMEWORKS = UIKit AVFoundation AudioToolbox
SpotlightActivator_LIBRARIES = activator
SpotlightActivator_LDFLAGS = -lactivator -Ltheos/lib 

include $(THEOS_MAKE_PATH)/tweak.mk

export COPYFILE_DISABLE = 1

after-install::
	install.exec "killall -9 SpringBoard"

