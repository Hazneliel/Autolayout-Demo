//
//  SizeAnimationViewController.m
//  ZNEAutoLayoutExample
//
//  Created by Ramirez, Jorge on 2/12/15.
//  Copyright (c) 2015 Ramirez, Jorge. All rights reserved.
//

#import "ZNESizeAnimationViewController.h"

@interface ZNESizeAnimationViewController ()

/**
 * First ImageView
 */
@property (nonatomic, strong) UIImageView *imageViewOne;

/**
 * Second ImageView
 */
@property (nonatomic, strong) UIImageView *imageViewTwo;

/**
 * Third ImageView
 */
@property (nonatomic, strong) UIImageView *imageViewThree;

/**
 * The Button for triggering the animation
 */
@property (nonatomic, strong) UIButton *animateButton;

/**
 * Example of property for NSLayoutConstraint for animating the constant
 */
@property (nonatomic, strong) NSLayoutConstraint *verticalConstraint;

/**
 * Bool representing if we're expanded or not.
 */
@property (nonatomic, getter = isExpanded) BOOL expanded;

/**
 * Triggered when user taps on "Animate" button.
 */
- (void)userDidTapAnimateButton:(id)sender;

@end

@implementation ZNESizeAnimationViewController

- (void)loadView {
    
    // Create our view
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.imageViewOne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alien"]];
    self.imageViewOne.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageViewOne.contentMode = UIViewContentModeScaleToFill;
    
    self.imageViewTwo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alien-2"]];
    self.imageViewTwo.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageViewTwo.contentMode = UIViewContentModeScaleToFill;
    
    self.imageViewThree = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alien-3"]];
    self.imageViewThree.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageViewThree.contentMode = UIViewContentModeScaleToFill;
    
    self.animateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.animateButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.animateButton setTitle:@"Animate" forState:UIControlStateNormal];
    [self.animateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.animateButton addTarget:self action:@selector(userDidTapAnimateButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.imageViewOne];
    [self.view addSubview:self.imageViewTwo];
    [self.view addSubview:self.imageViewThree];
    [self.view addSubview:self.animateButton];
    
    // Setup basic constraints to align and animate
    
    // Create dictionary of views to use in VFL
    NSDictionary *viewDict = NSDictionaryOfVariableBindings(_imageViewOne, _imageViewTwo, _imageViewThree, _animateButton);
    
    // Constraints for button
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[_animateButton]-25-|" options:0 metrics:nil views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_animateButton]-<=60-|" options:0 metrics:nil views:viewDict]];
    
    // constraint the image height to a constant value
    self.verticalConstraint = [NSLayoutConstraint constraintWithItem:self.imageViewOne attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.imageViewOne.intrinsicContentSize.height];
    [self.view addConstraint:self.verticalConstraint];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_imageViewOne]-20-[_imageViewTwo]-20-[_imageViewThree]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDict]];
    
    // Initially the image is expanded
    self.expanded = YES;
    
    // Center one along X axis, then others will follow based on NSLayoutFormatAlignAllCenterX
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewOne attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Animate Size Example";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark Button ActionHandler

- (void)userDidTapAnimateButton:(id)sender {
    
    // Triggering an animation is as simple as
    // changing the constant value
    if (self.isExpanded) {
        // Close
        self.verticalConstraint.constant = 0;
        
    } else {
        // Open
        self.verticalConstraint.constant = self.imageViewOne.intrinsicContentSize.height;
    }
    
    // Wrap layoutIfNeeded in animation block
    [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:15 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        // Swap
        self.expanded = !self.isExpanded;
    }];
}

@end
