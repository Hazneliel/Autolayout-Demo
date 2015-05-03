//
//  ZNEHorizontalAlignViewController.m
//  ZNEAutoLayoutExample
//
//  Created by Ramirez, Jorge on 2/12/15.
//  Copyright (c) 2015 Ramirez, Jorge. All rights reserved.
//

#import "ZNEHorizontalAlignViewController.h"

@interface ZNEHorizontalAlignViewController ()

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

@implementation ZNEHorizontalAlignViewController

- (void)loadView {
    
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
    NSDictionary *metrics = @{ @"imageWidth" : @(self.imageViewOne.image.size.width)};
    
    // If we try this alone, then one image will be stretched or shrunk
    //[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_imageViewOne][_imageViewTwo][_imageViewThree]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDict]];
    
    // So we need to adjust widths so they are all equal
    //[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_imageViewOne][_imageViewTwo(==_imageViewOne)][_imageViewThree(==_imageViewTwo)]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDict]];
    
    // If we do not want the image to stretch we use the imageViewOne.image.size.width in metrics
    // Now we do not want to constrains to the borders of the view
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_imageViewOne(imageWidth)]-[_imageViewTwo(==_imageViewOne)]-[_imageViewThree(==_imageViewTwo)]" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:viewDict]];
    
    // We center the middle image along the X axis, then others will follow based on NSLayoutFormatAlignAllCenterX
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewTwo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    // Finally center only one along Y axis, then others will follow based on NSLayoutFormatAlignAllCenterY
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageViewOne attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Horizontal Example";
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
