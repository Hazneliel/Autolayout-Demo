//
//  ZNECenteredViewController.m
//  ZNEAutoLayoutExample
//
//  Created by Ramirez, Jorge on 2/12/15.
//  Copyright (c) 2015 Ramirez, Jorge. All rights reserved.
//

#import "ZNECenteredViewController.h"

@interface ZNECenteredViewController ()

/**
 * The ImageView that will be centered
 */
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ZNECenteredViewController

- (void)loadView {
    
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alien"]];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.imageView];
    
    // Center along X axis
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    // Center along Y axis
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Centered Example";
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
