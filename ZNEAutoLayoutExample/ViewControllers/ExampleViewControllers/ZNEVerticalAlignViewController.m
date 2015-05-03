//
//  ZNEVerticalAlignViewController.m
//  ZNEAutoLayoutExample
//
//  Created by Ramirez, Jorge on 2/12/15.
//  Copyright (c) 2015 Ramirez, Jorge. All rights reserved.
//

#import "ZNEVerticalAlignViewController.h"

@interface ZNEVerticalAlignViewController ()

/**
 * First ImageView that will be aligned
 */
@property (nonatomic, strong) UIImageView *imageViewOne;

/**
 * Second ImageView that will be aligned
 */
@property (nonatomic, strong) UIImageView *imageViewTwo;

/**
 * Third ImageView that will be aligned
 */
@property (nonatomic, strong) UIImageView *imageViewThree;

@end

@implementation ZNEVerticalAlignViewController

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
    
    [self.view addSubview:self.imageViewOne];
    [self.view addSubview:self.imageViewTwo];
    [self.view addSubview:self.imageViewThree];
    
    // Setup basic constraints to align
    
    // Create dictionary of views to use in VFL
    NSDictionary *viewDict = NSDictionaryOfVariableBindings(_imageViewOne, _imageViewTwo, _imageViewThree);
    
    // If we dont set heights, note that they won't stretch, but rather size to
    // the max of the intrinsic content size, which is equal to the scaled image (1x) size.
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_imageViewOne][_imageViewTwo][_imageViewThree]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDict]];
    
    // Then align the middle one to the center vertically
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewTwo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    // Stretch all out to edges of superview. Note one is stretched
    //[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_imageViewOne][_imageViewTwo][_imageViewThree]|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDict]];
    
    // Make all equal in size, images will be stretched this way
    //[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_imageViewOne][_imageViewTwo(==_imageViewOne)][_imageViewThree(==_imageViewOne)]|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDict]];
    
    // Equal sizes with 20pt spacing between, this also stretches
    //[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_imageViewOne]-[_imageViewTwo(==_imageViewOne)]-[_imageViewThree(==_imageViewTwo)]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDict]];
    
    // Center one along X axis, then others will follow based on NSLayoutFormatAlignAllCenterX
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewOne attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Vertical Example";
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
