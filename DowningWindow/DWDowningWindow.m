//
//  DWDowningWindow.m
//  DowningWindow
//
//  Created by Fangzhou Lu on 9/26/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "DWDowningWindow.h"

@interface DWDowningWindow()

@property UIDynamicAnimator *animator;
@property UIGravityBehavior *gravity;

@end

@implementation DWDowningWindow{
    UIView *contentView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5]; // Use self.alpha will influence its subview.
        
        contentView = [[UIView alloc] initWithFrame:CGRectZero];
        contentView.backgroundColor = [UIColor whiteColor];
        contentView.opaque = YES;
        
        [self addSubview:contentView];
    }
    return self;
}


- (void)layoutSubviews
{
    contentView.frame = CGRectMake(self.center.x - 100,0, 200, 150);
    
//    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
//    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[contentView]];
//    [self.animator addBehavior:self.gravity];
    
    [UIView animateWithDuration:0.5f animations:^{
        contentView.center = self.center;
    }];
}

@end
