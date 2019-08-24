#import <SpringBoard/SpringBoard.h>
#import <SpringBoard/SBApplication.h>
#import <objc/runtime.h>
#import <libactivator/libactivator.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface AXSpringBoardServer
	+ (id)server;
	- (void)revealSpotlight;
@end

@interface STActivatorListener : NSObject <LAListener> {} 
@end

@implementation STActivatorListener
-(void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
    @autoreleasepool {
		AudioServicesPlaySystemSound(1520);
	    [(AXSpringBoardServer *)[%c(AXSpringBoardServer) server] revealSpotlight];
	}
}

+(void)load {
    @autoreleasepool {
    	[LASharedActivator registerListener:[self new] forName:@"Show Spotlight"];
    }
}
@end