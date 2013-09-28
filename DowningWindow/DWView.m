//
//  DWView.m
//  DowningWindow
//
//  Created by Fangzhou Lu on 9/26/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "DWView.h"
#import "DWDowningWindow.h"

@interface DWView()

@property UIButton *button;
@property Boolean isWindowDown;

@end

@implementation DWView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _isWindowDown = NO;
        
        self.backgroundColor = [UIColor whiteColor];
        
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _button.frame = CGRectMake(0, 0, 200, 70);
        [_button addTarget:self action:@selector(downWindow) forControlEvents:UIControlEventTouchDown];
        [_button setTitle:@"Press Me!!" forState:UIControlStateNormal];
        
        [self addSubview:_button];
    }
    return self;
}

- (void)downWindow
{
    if (self.isWindowDown == false) {
        DWDowningWindow *downWindow = [[DWDowningWindow alloc] initWithFrame:self.frame];
        [self addSubview:downWindow];
    }
    
}

- (void)layoutSubviews
{
    self.button.center = self.center;
}

@end
