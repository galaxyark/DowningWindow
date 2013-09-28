//
//  DWDowningWindow.m
//  DowningWindow
//
//  Created by Fangzhou Lu on 9/26/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "DWDowningWindow.h"
#import <CoreGraphics/CoreGraphics.h>

#define VALIDTAPRADIOUS 30.0

@interface DWDowningWindow()

@property UIDynamicAnimator *animator;
@property UIGravityBehavior *gravity;

@end

@implementation DWDowningWindow{
    UIView *contentView;
    UILongPressGestureRecognizer *tapRecognizer;
    UIImageView *closeButton;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0]; // Use self.alpha will influence its subview.
        
        contentView = [[UIView alloc] initWithFrame:CGRectZero];
        contentView.backgroundColor = [UIColor whiteColor];
        contentView.opaque = YES;
        contentView.layer.cornerRadius = 5.0f;
        
        [self addSubview:contentView];
        
        tapRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tabGestureHandler:)];
        tapRecognizer.minimumPressDuration = 0.001;
        [contentView addGestureRecognizer:tapRecognizer];
        
        closeButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup-close.png"] highlightedImage:[UIImage imageNamed:@"popup-close-highlighted.png"]];
        [contentView addSubview:closeButton];        
    }
    return self;
}


- (void)layoutSubviews
{
    contentView.frame = CGRectMake(self.center.x - 100,0, 200, 150);
    
//    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
//    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[contentView]];
//    [self.animator addBehavior:self.gravity];
    closeButton.center = CGPointMake(0, 0);

    [UIView animateWithDuration:0.5f animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        contentView.center = self.center;
    }];
}

- (void)tabGestureHandler:(UIGestureRecognizer *)recognizer
{
    UIView *view = [recognizer view];
    CGPoint location = [recognizer locationInView:view];
    if((pow(location.x, 2) + pow(location.y, 2)) <= pow(VALIDTAPRADIOUS, 2)){
        closeButton.highlighted = YES;
        
        if (recognizer.state == UIGestureRecognizerStateEnded) {
            [self leave];
        }
    }else{
        closeButton.highlighted = NO;
    }
}

- (void)leave
{
    [UIView animateWithDuration:0.5f animations:^{
        contentView.center = CGPointMake(contentView.center.x, self.frame.origin.y - contentView.frame.size.height/2);
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
