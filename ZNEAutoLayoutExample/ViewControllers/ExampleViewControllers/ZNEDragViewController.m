//
//  ZNEDragViewController.m
//  ZNEAutoLayoutExample
//
//  Created by Ramirez, Jorge on 2/13/15.
//  Copyright (c) 2015 Ramirez, Jorge. All rights reserved.
//

#import "ZNEDragViewController.h"

@interface ZNEDragViewController ()

/**
 * First ImageView
 */
@property (nonatomic, strong) UIImageView *imageViewOne;

/**
 * Second ImageView
 */
@property (nonatomic, strong) UIImageView *imageViewTwo;

/**
 * Handles drag on view
 */
- (void)handleDragGesture:(UIPanGestureRecognizer *)panGesture;

@end

@implementation ZNEDragViewController

- (void)loadView {
    
    // Create our view
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.imageViewOne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alien"]];
    self.imageViewOne.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageViewOne.contentMode = UIViewContentModeScaleToFill;
    self.imageViewOne.userInteractionEnabled = YES;
    
    // add gesture
    UIPanGestureRecognizer *panGestureRecognizerOne = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDragGesture:)];
    [self.imageViewOne addGestureRecognizer:panGestureRecognizerOne];

 
    
    self.imageViewTwo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alien-2"]];
    self.imageViewTwo.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageViewTwo.contentMode = UIViewContentModeScaleToFill;
    self.imageViewTwo.userInteractionEnabled = YES;
    
    // add gesture
    UIPanGestureRecognizer *panGestureRecognizerTwo = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDragGesture:)];
    [self.imageViewTwo addGestureRecognizer:panGestureRecognizerTwo];
    
    [self.view addSubview:self.imageViewOne];
    [self.view addSubview:self.imageViewTwo];
    
    // Setup basic constraints to align and animate
    
    // Create dictionary of views to use in VFL
    NSDictionary *viewDict = NSDictionaryOfVariableBindings(_imageViewOne, _imageViewTwo);
    
    // Constrain the views vertically
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[_imageViewOne]-50-[_imageViewTwo(>=0)]->=0-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDict]];
    
    // Center one along X axis, then others will follow based on NSLayoutFormatAlignAllCenterX
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewOne attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Drag Example";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)handleDragGesture:(UIPanGestureRecognizer *)panGesture {
    
    CGPoint translation = [panGesture translationInView:self.view];
    CGPoint translatedCenter = CGPointMake(panGesture.view.center.x + translation.x, panGesture.view.center.y + translation.y);
    // Reset translation
    [panGesture setTranslation:CGPointZero inView:self.view];
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged: {
            
            // Set new center
            // Note how it doesn't trigger a layout, thereby forcing it to abide by constraints
            [UIView animateWithDuration:0.10 animations:^{
                panGesture.view.center = translatedCenter;
            }];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            // Put back!
            [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:15 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                // Mark view dirty
                [self.view setNeedsLayout];
                [self.view layoutIfNeeded];
            } completion:nil];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        default:
            break;
    }
}

@end
