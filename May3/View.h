//
//  View.h
//  May3
//
//  Created by Noah Blake on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolBox/AudioToolbox.h>
@class Score;

@interface View: UIView {
	UIView *paddle1;
    UIView *paddle2;
	UIView *ball;
	CGFloat dx, dy;	//direction and speed of ball's motion
    SystemSoundID   soundFileObject;
    Score *score1;
    Score *score2;
}

- (void) move: (CADisplayLink *) displayLink;
@end

