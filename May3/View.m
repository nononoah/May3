//
//  View.m
//  May3
//
//  Created by Noah Blake on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "ViewController.h"
#import "Score.h"


@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor blackColor];
        

		//Create the paddle.
		frame = CGRectMake(40, 100, 20, 100);
		paddle1 = [[UIView alloc] initWithFrame: frame];
		paddle1.backgroundColor = [UIColor whiteColor];
		[self addSubview: paddle1];
        
        frame = CGRectMake(self.bounds.size.height - 40, 100, 20, 100);
		paddle2 = [[UIView alloc] initWithFrame: frame];
		paddle2.backgroundColor = [UIColor whiteColor];
		[self addSubview: paddle2];
        
		//Create the ball in the upper left corner of this View.
		frame = CGRectMake(0, 20, 20, 20);
		ball = [[UIView alloc] initWithFrame: frame];
		ball.backgroundColor = [UIColor whiteColor];
		[self addSubview: ball];
        
		//Ball initially moves to lower right.
		dx = 3;
		dy = 3;
        
        
     //Set up the player's score cards   
     score1 = [[Score alloc] initWithView: self forPlayer: 1];
     [self addSubview: score1];
     
     score2 = [[Score alloc] initWithView: self forPlayer: 2];
     [self addSubview: score2];
    
	}
    
	return self;
}

//Change the ball's direction of motion,
//if necessary to avoid an impending collision.

- (void) bounce {	
	//Where the ball would be if its horizontal motion were allowed
	//to continue for one more move.
	CGRect horizontal = ball.frame;
	horizontal.origin.x += dx;
    
	
	//Where the ball would be if its vertical motion were allowed
	//to continue for one more move.
	CGRect vertical = ball.frame;
	vertical.origin.y += dy;

	
	//Ball must remain inside self.bounds.
	
    if (!CGRectEqualToRect(horizontal, CGRectIntersection(horizontal, self.bounds))) {
		//Ball will bounce off left or right edge of View. Add a point, respawn the ball.
    	if (horizontal.origin.x < 10){
        [score2 scoreChange];
        [ball removeFromSuperview];
        CGRect frame = CGRectMake(self.center.x + 50, self.center.y - 50, 20, 20);
        ball = [[UIView alloc] initWithFrame: frame];
        ball.backgroundColor = [UIColor whiteColor];
        [self addSubview: ball];
        
        }
         else{
         [score1 scoreChange];
             [ball removeFromSuperview];
             CGRect frame = CGRectMake(self.center.x + 50, self.center.y - 50, 20, 20);
             ball = [[UIView alloc] initWithFrame: frame];
             ball.backgroundColor = [UIColor whiteColor];
             [self addSubview: ball];
         }
    //randomize ball direction
    int i = (rand() % 2) * 2 - 1;
    dx *= i;   
         
	}

	
	if (!CGRectEqualToRect(vertical, CGRectIntersection(vertical, self.bounds))) {
		//Ball will bounce off top or bottom edge of View.
		dy = -dy;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"beep" 
                                                            object:nil];

	}
	
	//If the ball is not currently intersecting the paddle,
	if (!CGRectIntersectsRect(ball.frame, paddle1.frame) && !CGRectIntersectsRect(ball.frame, paddle2.frame)) {
		
		//but if the ball will intersect the paddle on the next move,
		if (CGRectIntersectsRect(horizontal, paddle1.frame) || CGRectIntersectsRect(horizontal, paddle2.frame)) {
			dx = -dx;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"beep" 
                                                                object:nil];

		}
		
		if (CGRectIntersectsRect(vertical, paddle1.frame) || CGRectIntersectsRect(vertical, paddle2.frame)) {
			dy = -dy;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"beep" 
                                                                object:nil];
            
		}
        		
    }
}



- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	UITouch *touch = [touches anyObject];
	CGPoint p = [touch locationInView: self];
	CGFloat y = p.y;
	
	//Don't let the paddle move off the bottom or top of the View.
	CGFloat half = paddle1.bounds.size.height / 2;
	y = MIN(y, self.bounds.size.height - half); //don't let y get too big
	y = MAX(y, half);                         //don't let y get too small
	
    if (p.x > paddle1.center.x - 100 && p.x < paddle1.center.x + 100){ 
	paddle1.center = CGPointMake(paddle1.center.x, y);
    }
    else {
        paddle2.center = CGPointMake(paddle2.center.x, y);    
        }
	[self bounce];
}

- (void) move: (CADisplayLink *) displayLink {
	//NSLog(@"%.15g", displayLink.timestamp);	//15 significant digits
	
	ball.center = CGPointMake(ball.center.x + dx, ball.center.y + dy);
	[self bounce];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
