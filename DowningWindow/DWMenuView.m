//
//  DWMenuView.m
//  DowningWindow
//
//  Created by Fangzhou Lu on 9/27/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "DWMenuView.h"

@implementation DWMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.alpha = 0.8f;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
