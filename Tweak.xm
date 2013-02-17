#import <objc/runtime.h>
#import "/opt/theos/include/Springboard/Springboard.h"


%hook SBAwayLockBar
-(BOOL)showsCameraGrabber
{
	return NO;
}

-(void)setShowsCameraGrabber:(BOOL)grabber
{
	[[self.subviews objectAtIndex:1] setFrame:CGRectMake(20,22,280,52)];
	grabber = NO;
	%orig;
}

%end


%hook TPBottomLockBar
-(void)setKnobWellWidth:(float)width
{
	//width = 280;
	%orig;
}
%end


#define kCFCoreFoundationVersionNumber_iOS_5_0 661.00

__attribute__((constructor)) static void init()
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    %init;

    [pool release];
}