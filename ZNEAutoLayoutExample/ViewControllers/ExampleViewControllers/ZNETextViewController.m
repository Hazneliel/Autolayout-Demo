//
//  ZNETextViewController.m
//  ZNEAutoLayoutExample
//
//  Created by Ramirez, Jorge on 2/13/15.
//  Copyright (c) 2015 Ramirez, Jorge. All rights reserved.
//

#import "ZNETextViewController.h"

@interface ZNETextViewController ()

@property (nonatomic, strong) UILabel *firstLabel;

@property (nonatomic, strong) UILabel *secondLabel;

@property (nonatomic, strong) UILabel *thirdLabel;

@property (nonatomic, strong) UILabel *fourthLabel;

@property (nonatomic, strong) UILabel *fifthLabel;

@end

@implementation ZNETextViewController

- (void)loadView {
    
    // Create our view
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    
    // Create labels
    self.firstLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.firstLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.firstLabel.numberOfLines = 0;
    self.firstLabel.backgroundColor = [UIColor lightGrayColor];
    self.firstLabel.font = [UIFont systemFontOfSize:14];
    self.firstLabel.text = @"Lorem ipsum dolor sit amet.";
    [self.view addSubview:self.firstLabel];
    
    self.secondLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.secondLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.secondLabel.numberOfLines = 0;
    self.secondLabel.backgroundColor = [UIColor darkGrayColor];
    self.secondLabel.textColor = [UIColor whiteColor];
    self.secondLabel.font = [UIFont systemFontOfSize:14];
    self.secondLabel.text = @"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.";
    [self.view addSubview:self.secondLabel];
    
    self.thirdLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.thirdLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.thirdLabel.numberOfLines = 0;
    self.thirdLabel.backgroundColor = [UIColor lightGrayColor];
    self.thirdLabel.font = [UIFont systemFontOfSize:14];
    self.thirdLabel.text = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.";
    [self.view addSubview:self.thirdLabel];
    
    self.fourthLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.fourthLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.fourthLabel.numberOfLines = 0;
    self.fourthLabel.backgroundColor = [UIColor darkGrayColor];
    self.fourthLabel.font = [UIFont systemFontOfSize:14];
    self.fourthLabel.textColor = [UIColor whiteColor];
    self.fourthLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    [self.view addSubview:self.fourthLabel];
    
    self.fifthLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.fifthLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.fifthLabel.numberOfLines = 0;
    self.fifthLabel.backgroundColor = [UIColor lightGrayColor];
    self.fifthLabel.font = [UIFont systemFontOfSize:14];
    self.fifthLabel.text = @"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.";
    [self.view addSubview:self.fifthLabel];
    
    // Uncomment to set Content Compression Resistance
//    [self.firstLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
//    [self.secondLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
//    [self.thirdLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
//    [self.fourthLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
//    [self.fifthLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
//
    
    // Uncomment to set Content Hugging Resistance
    // Note how the second label is expanded since the priority of the first label is set to required.
    [self.firstLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
//    [self.secondLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
//    [self.thirdLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
//    [self.fourthLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
//    [self.fifthLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    // Create dictionary of views to use in VFL
    
    // get our topLayoutGuide, so that we can align text
    // or the view to the BOTTOM of the Navigation bar. Otherwise, if we
    // have edges extend under nav bar, we'd show up under it.
    id topLayoutGuide = self.topLayoutGuide;
    
    NSDictionary *viewDict = NSDictionaryOfVariableBindings(topLayoutGuide, _firstLabel, _secondLabel, _thirdLabel, _fourthLabel, _fifthLabel);
    
    // Constrain
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_firstLabel]-|" options:0 metrics:nil views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_secondLabel]-|" options:0 metrics:nil views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_thirdLabel]-|" options:0 metrics:nil views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_fourthLabel]-|" options:0 metrics:nil views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_fifthLabel]-|" options:0 metrics:nil views:viewDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide]-[_firstLabel]-[_secondLabel]-[_thirdLabel]-[_fourthLabel]-[_fifthLabel]-|" options:0 metrics:nil views:viewDict]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UILabel Example";
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
