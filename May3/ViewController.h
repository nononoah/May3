//
//  ViewController.h
//  May3
//
//  Created by Noah Blake on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>	//for CADisplayLink
#import <AudioToolbox/AudioToolbox.h>


@interface ViewController: UIViewController {
	CADisplayLink *displayLink;
    SystemSoundID sid;
}

- (void) beep: (NSNotification *) notification;

@end
