#import <libactivator/libactivator.h>
#import <AVFoundation/AVFoundation.h>

@interface STActivatorListener : NSObject <LAListener> {} 
@end

@implementation STActivatorListener
-(void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
    @autoreleasepool {
	    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	    [dateFormatter setDateFormat:@"hh:mm a"];

	    NSString *formattedDateString = [dateFormatter stringFromDate:[NSDate date]];

	    [dateFormatter release];
	    
	    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:formattedDateString];
	    utterance.rate = 0.4;
	    
	    AVSpeechSynthesizer *speechSynthesizer = [[[AVSpeechSynthesizer alloc] init] autorelease];
	    [speechSynthesizer speakUtterance:utterance];
	}
}

+(void)load {
    @autoreleasepool {
    	[LASharedActivator registerListener:[self new] forName:@"Speak current time"];
    }
}
@end