TWEAK_NAME = NoCameraGrabber
NoCameraGrabber_OBJCC_FILES = Tweak.mm
SYSROOT=/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk
NoCameraGrabber_CFLAGS = -F$(SYSROOT)/System/Library/CoreServices
NoCameraGrabber_PRIVATE_FRAMEWORKS = UIKit CoreGraphics Foundation
LDFLAGS += -march=armv7
include theos/makefiles/common.mk
include theos/makefiles/tweak.mk

sync: stage
	rsync -z _/Library/MobileSubstrate/DynamicLibraries/* root@10.0.2.6:/Library/MobileSubstrate/DynamicLibraries/
	ssh root@10.0.2.6 killall SpringBoard
	
sync2: stage
	rsync -z _/Library/MobileSubstrate/DynamicLibraries/* root@10.0.2.2:/Library/MobileSubstrate/DynamicLibraries/
	ssh root@10.0.2.2 killall SpringBoard
	
sync3: stage
	rsync -z _/Library/MobileSubstrate/DynamicLibraries/* root@192.168.1.36:/Library/MobileSubstrate/DynamicLibraries/
	ssh root@192.168.1.36 killall SpringBoard
	
sync4: stage
	rsync -z _/Library/MobileSubstrate/DynamicLibraries/* root@192.168.1.30:/Library/MobileSubstrate/DynamicLibraries/
	ssh root@192.168.1.30 killall SpringBoard