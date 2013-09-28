//
//  DWView.m
//  DowningWindow
//
//  Created by Fangzhou Lu on 9/26/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "DWView.h"
#import "DWDowningWindow.h"
#import "DWMenuView.h"

@interface DWView()

@property UIButton *button;
@property UIButton *menuButton;
@property Boolean isWindowDown;
@property Boolean isMenuUp;
@property DWMenuView *menu;
@property UIView *coverView;

@end

@implementation DWView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _isWindowDown = NO;
        _isMenuUp = NO;
        
        self.backgroundColor = [UIColor whiteColor];
        
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _button.frame = CGRectMake(0, 0, 200, 70);
        [_button addTarget:self action:@selector(downWindow) forControlEvents:UIControlEventTouchDown];
        [_button setTitle:@"Press Me!!" forState:UIControlStateNormal];
        [self addSubview:_button];
        
        _menuButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _menuButton.frame = CGRectZero;
        [_menuButton addTarget:self action:@selector(popupMenu) forControlEvents:UIControlEventTouchDown];
        [_menuButton setTitle:@"Pop menu" forState:UIControlStateNormal];
        [self addSubview:_menuButton];
        
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

- (void)popupMenu
{
    if (!self.isMenuUp) {
        if (self.menu == nil) {
            self.menu = [[DWMenuView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height - 125)];
        }
        
        if (self.coverView == nil) {
            self.coverView = [[UIView alloc] initWithFrame:self.frame];
            self.coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        }
        
        [self addSubview:self.coverView];
        [self addSubview:self.menu];
        
        [UIView animateWithDuration:0.4f animations:^{
            self.coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
            self.menu.center = CGPointMake(self.menu.center.x, self.menu.center.y - self.menu.frame.size.height);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                self.menu.center = CGPointMake(self.menu.center.x, self.menu.center.y + 15);
            } completion:^(BOOL finished) {
                self.isMenuUp = YES;
            }];
        }];
    }else{
        [UIView animateWithDuration:0.5f animations:^{
            self.coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
            self.menu.center = CGPointMake(self.menu.center.x, self.menu.center.y + self.frame.size.height - 140);
        } completion:^(BOOL finished) {
            [self.coverView removeFromSuperview];
            [self.menu removeFromSuperview];
            self.isMenuUp = NO;
        }];
    }
}

- (void)layoutSubviews
{
    [self.menuButton sizeToFit];
    self.menuButton.center = CGPointMake(self.center.x, self.center.y - 200);
    self.button.center = self.center;
}

@end
