GO_EASY_ON_ME=1
DEBUG = 0
THEOS_DEVICE_IP=192.168.1.101
ARCHS = armv7 arm64
include /opt/theos/makefiles/common.mk

TWEAK_NAME = SpeakTime
SpeakTime_FILES = Tweak.xm
SpeakTime_FRAMEWORKS = UIKit AVFoundation
SpeakTime_LDFLAGS = -lactivator -Ltheos/lib 

include /opt/theos/makefiles/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
