#line 1 "Tweak.xm"
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class AXSpringBoardServer; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$AXSpringBoardServer(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("AXSpringBoardServer"); } return _klass; }
#line 16 "Tweak.xm"
@implementation STActivatorListener
-(void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
    @autoreleasepool {
		AudioServicesPlaySystemSound(1520);
	    [(AXSpringBoardServer *)[_logos_static_class_lookup$AXSpringBoardServer() server] revealSpotlight];
	}
}

+(void)load {
    @autoreleasepool {
    	[LASharedActivator registerListener:[self new] forName:@"Show Spotlight"];
    }
}
@end
#line 30 "Tweak.xm"
