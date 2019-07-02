//
//  SCCProgramSuggestionsListViewController.m
//  SweatCodeChallenge
//
//  Created by Alvin He on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "SCCProgramSuggestionsListViewController.h"

@interface SCCProgramSuggestionsListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation SCCProgramSuggestionsListViewController
    
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.separatorColor = UIColor.clearColor;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    [self setProperties];
}
    
- (void)initProperties {
    UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 78, 44)];
    logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    logoImageView.image = [UIImage imageNamed:@"sweat-logo"];
    self.navigationItem.titleView = logoImageView;
}
    
- (void)setProperties {
    self.view.backgroundColor = UIColor.whiteColor;
    self.tableView.tableHeaderView = [self tableViewHeaderViewWithTitle:@"Program Suggestions"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}
    
#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}
    
#pragma mark - Custom Methods
- (UIView *)tableViewHeaderViewWithTitle:(NSString *)text {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(18, 20, SCREEN_WIDTH - 36, 24)];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont montserratBoldWithSize:20];
    label.numberOfLines = 0;
    label.text = text;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    [headerView addSubview:label];
    return headerView;
}

@end

