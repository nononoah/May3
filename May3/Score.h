//
//  Score.h
//  May3
//
//  Created by Noah Blake on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Score : UILabel {
    View *view;
    UILabel *score;
    int points;
    int player;
}
- (id) initWithView: (View *) v forPlayer: (int) p;
-(void) scoreChange;
@end