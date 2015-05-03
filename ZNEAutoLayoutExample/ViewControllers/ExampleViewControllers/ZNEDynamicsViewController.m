//
//  ZNEDynamicsViewController.m
//  ZNEAutoLayoutExample
//
//  Created by Ramirez, Jorge on 2/13/15.
//  Copyright (c) 2015 Ramirez, Jorge. All rights reserved.
//

#import "ZNEDynamicsViewController.h"

@interface ZNEDynamicsViewController () <UICollisionBehaviorDelegate>

/**
 * First ImageView
 */
@property (nonatomic, strong) UIImageView *imageViewOne;

/**
 * The UIKit dynamic animator
 */
@property (nonatomic, strong) UIDynamicAnimator *dynamicAnimator;

/**
 * The Gravity behavior
 */
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;

/**
 * Collision behavior
 */
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;

/**
 * Button to trigger the gravity animation
 */
@property (nonatomic, strong) UIButton *triggerButton;

/**
 * Called when user taps trigger button
 */
- (void)userDidTapTriggerButton:(id)sender;

@end

@implementation ZNEDynamicsViewController

- (void)loadView {
    
    // Create our view
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    
    // Create our animator
    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.imageViewOne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alien"]];
    self.imageViewOne.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageViewOne.contentMode = UIViewContentModeScaleToFill;
    
    [self.view addSubview:self.imageViewOne];
    
    // Button that will simply power animation
    self.triggerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.triggerButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.triggerButton setTitle:@"Start!" forState:UIControlStateNormal];
    [self.triggerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.triggerButton addTarget:self action:@selector(userDidTapTriggerButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.triggerButton];
    
    // Setup basic constraints to align and drag
    
    // Create dictionary of views to use in VFL
    NSDictionary *viewDict = NSDictionaryOfVariableBindings(_imageViewOne, _triggerButton);
    
    // Constraints for button
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[_triggerButton]-25-|" options:0 metrics:nil views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_triggerButton]-50-|" options:0 metrics:nil views:viewDict]];
    
    // Constrain the views vertically
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[_imageViewOne]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDict]];
    
    // Center one along X axis, then others will follow based on NSLayoutFormatAlignAllCenterX
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewOne attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Dynamics Example";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Setup dynamics
    // If you add these to the animator before viewDidAppear, it wont work
    // So make sure you create these after the frame is laid out with autoLayout
    self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.imageViewOne]];
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.imageViewOne]];
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    self.collisionBehavior.collisionDelegate = self;
}

- (void)userDidTapTriggerButton:(id)sender {
    
    // Add dynamics
    [self.dynamicAnimator addBehavior:self.collisionBehavior];
    [self.dynamicAnimator addBehavior:self.gravityBehavior];
}

#pragma mark Collision Delegate

- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(id <NSCopying>)identifier {
    
    if ([item isEqual:self.imageViewOne]) {
        
        // Remove behaviors (this will remove bounce of gravity too in this example)
        [self.dynamicAnimator removeBehavior:self.gravityBehavior];
        [self.dynamicAnimator removeBehavior:self.collisionBehavior];
        
        // Put back!
        [UIView animateWithDuration:0.75 delay:1.0 usingSpringWithDamping:0.4 initialSpringVelocity:15 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            // Mark view dirty
            [self.view setNeedsLayout];
            [self.view layoutIfNeeded];
        } completion:nil];
    }
}

@end
