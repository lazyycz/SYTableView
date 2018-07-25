//
//  SYTableViewController.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "SYTableViewController.h"
#import "SYTableViewControllerDataFactory.h"
#import "SYTableViewCell.h"
#import "SYTableViewHeaderFooterView.h"
#import "UIResponder+Router.h"

extern NSString *const kSYGoodsInfoTableViewCellLeftButtonClicked;
extern NSString *const kSYGoodsInfoTableViewCellRightButtonClicked;

@interface SYTableViewController ()

@property (nonatomic, strong) SYTableViewControllerDataFactory *dataFactory;

@end

@implementation SYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"SYTableViewController";
    
    __weak typeof(self) weakSelf = self;
    [self.dataFactory handleData:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.tableView reloadData];
    }];
    
    [self addUserEvent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - user event

- (void)addUserEvent
{
    NSDictionary <NSString *, NSString *>*enventStrategy = @{
                                                             kSYGoodsInfoTableViewCellLeftButtonClicked : NSStringFromSelector(@selector(didClickLeftButtonEvent:)),
                                                             kSYGoodsInfoTableViewCellRightButtonClicked : NSStringFromSelector(@selector(didClickRightButtonEvent:)),
                                     };
    
    [enventStrategy enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        [self addEventWithName:key selector:NSSelectorFromString(obj)];
    }];
}

- (void)didClickLeftButtonEvent:(id)anObject
{
    NSLog(@"%@, %@", NSStringFromSelector(_cmd), anObject);
}

- (void)didClickRightButtonEvent:(id)anObject
{
    NSLog(@"%@, %@", NSStringFromSelector(_cmd), anObject);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataFactory.cellRows.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataFactory.cellRows[section].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SYTableViewCell cellHeightWithTableView:tableView
                                           tableRow:[self.dataFactory fetchCellRowWithIndexPath:indexPath]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [SYTableViewHeaderFooterView headerViewHeightWithTableView:tableView
                                                       tableRow:[self.dataFactory fetcheHeaderRowWithSection:section]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SYTableViewControllerRow *row = [self.dataFactory fetchCellRowWithIndexPath:indexPath];
    return [SYTableViewCell initCellWithTableView:tableView
                                         cellName:row.rowName
                                         delegate:self];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SYTableViewControllerRow *row = [self.dataFactory fetcheHeaderRowWithSection:section];
    return [SYTableViewHeaderFooterView initViewWithTableView:tableView
                                                     viewName:row.rowName
                                                     delegate:self];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [((SYTableViewCell *)cell) reloadCellWithContent:[self.dataFactory fetchCellRowWithIndexPath:indexPath]];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    [(SYTableViewHeaderFooterView *)view reloadViewWithContent:[self.dataFactory fetcheHeaderRowWithSection:section]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - getter

- (SYTableViewControllerDataFactory *)dataFactory
{
    if (!_dataFactory) {
        _dataFactory = [SYTableViewControllerDataFactory new];
    }
    return _dataFactory;
}

@end
