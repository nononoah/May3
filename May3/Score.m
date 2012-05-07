//
//  Score.m
//  May3
//
//  Created by Noah Blake on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Score.h"
#import "View.h"

@implementation Score

- (id) initWithView: (View *) v forPlayer: (int) p {
    
 	player = p;
    
    if (player == 1){
        CGRect f = CGRectMake(60, 0, 80, 20);
        self = [super initWithFrame: f];
    }
    
    if (player == 2){
        CGRect f = CGRectMake(355, 0, 80, 20);
        self = [super initWithFrame: f];
    }
    
	if (self) {
	}
    return self;
}


 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
     //create the player's score
    
     NSString *string = [NSString stringWithFormat: @"Player %i: %i", player, points];
     UIFont *font = [UIFont systemFontOfSize: 15];
     
     CGRect f = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
     
     score = [[UILabel alloc] initWithFrame: f];
     score.textColor = [UIColor whiteColor];
     score.backgroundColor = [UIColor blackColor];
     score.font = font;
     score.text = string;
     score.textAlignment = UITextAlignmentLeft;
     score.userInteractionEnabled = NO;
     
     [self addSubview: score];
     ++points;
 }

-(void) scoreChange{
    [self setNeedsDisplay];
}



@end
