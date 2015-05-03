//
//  ZNEViewController.m
//  ZNEAutoLayoutExample
//
//  Created by Ramirez, Jorge on 2/12/15.
//  Copyright (c) 2015 Ramirez, Jorge. ZNEl rights reserved.
//

#import "ZNEViewController.h"
#import "ZNECenteredViewController.h"
#import "ZNEHorizontalAlignViewController.h"
#import "ZNEVerticalAlignViewController.h"
#import "ZNESizeAnimationViewController.h"
#import "ZNEDragViewController.h"
#import "ZNEDynamicsViewController.h"
#import "ZNETextViewController.h"

typedef NS_ENUM(NSUInteger, ZNEAutoLayoutSampleCellType) {
    ZNEAutoLayoutSampleCentered,
    ZNEAutoLayoutSampleAlignHorizontally,
    ZNEAutoLayoutSampleAlignVertically,
    ZNEAutoLayoutSampleAnimateSize,
    ZNEAutoLayoutSampleDragView,
    ZNEAutoLayoutSampleDynamics,
    ZNEAutoLayoutSampleText
};

@interface ZNEViewController () <UITableViewDataSource, UITableViewDelegate>

/*
 * Contains the titles for the cells
 */
@property (nonatomic, strong) NSMutableArray *cellTitlesArray;

@end

@implementation ZNEViewController

- (void)loadView {
    
    /* Setup table view */
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.view = tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AutoLayout Demos";
    
    self.cellTitlesArray = [NSMutableArray array];
    self.cellTitlesArray[ZNEAutoLayoutSampleCentered] = @"Centered Example";
    self.cellTitlesArray[ZNEAutoLayoutSampleAlignHorizontally] = @"Horizontal Example";
    self.cellTitlesArray[ZNEAutoLayoutSampleAlignVertically] = @"Vertical Example";
    self.cellTitlesArray[ZNEAutoLayoutSampleAnimateSize] = @"Animate Size Example";
    self.cellTitlesArray[ZNEAutoLayoutSampleDragView] = @"Drag Example";
    self.cellTitlesArray[ZNEAutoLayoutSampleDynamics] = @"Dynamics Example";
    self.cellTitlesArray[ZNEAutoLayoutSampleText] = @"UILabel Example";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // register cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma UITableView delegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.cellTitlesArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cellTitlesArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Load proper demo controller
    
    switch (indexPath.row) {
        case ZNEAutoLayoutSampleCentered: {
            ZNECenteredViewController *viewController = [[ZNECenteredViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case ZNEAutoLayoutSampleAlignHorizontally: {
            ZNEHorizontalAlignViewController *viewController = [[ZNEHorizontalAlignViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case ZNEAutoLayoutSampleAlignVertically: {
            ZNEVerticalAlignViewController *viewController = [[ZNEVerticalAlignViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case ZNEAutoLayoutSampleAnimateSize: {
            ZNESizeAnimationViewController *viewController = [[ZNESizeAnimationViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case ZNEAutoLayoutSampleDragView: {
            ZNEDragViewController *viewController = [[ZNEDragViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case ZNEAutoLayoutSampleDynamics: {
            ZNEDynamicsViewController *viewController = [[ZNEDynamicsViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case ZNEAutoLayoutSampleText: {
            ZNETextViewController *viewController = [[ZNETextViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
