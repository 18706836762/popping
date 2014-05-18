//
//  AnimationsListViewController.m
//  Popping
//
//  Created by André Schneider on 10.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "AnimationsListViewController.h"
#import "ButtonViewController.h"
#import "PanViewController.h"
#import "PaperButtonViewController.h"
#import "CustomTransitionViewController.h"
#import "ConstraintsViewController.h"

static NSString * const kCellIdentifier = @"cellIdentifier";

@interface AnimationsListViewController()
@property(nonatomic) NSArray *items;
@end

@implementation AnimationsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Popping";
    self.items = @[@[@"Button Animation", [ButtonViewController class]],
                   @[@"Pan Animation", [PanViewController class]],
                   @[@"Paper Button Animation", [PaperButtonViewController class]],
                   @[@"Custom Transition", [CustomTransitionViewController class]],
                   @[@"Layout Constraints", [ConstraintsViewController class]]
                   ];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:kCellIdentifier];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController = [[self.items[indexPath.row] lastObject] new];
    viewController.title = [self.items[indexPath.row] firstObject];
    [self.navigationController pushViewController:viewController
                                         animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier
                                                            forIndexPath:indexPath];
    cell.textLabel.text = [self.items[indexPath.row] firstObject];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
