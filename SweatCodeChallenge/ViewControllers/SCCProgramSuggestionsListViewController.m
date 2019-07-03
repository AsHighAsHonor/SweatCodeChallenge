//
//  SCCProgramSuggestionsListViewController.m
//  SweatCodeChallenge
//
//  Created by Alvin He on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "SCCProgramSuggestionsListViewController.h"
#import "SCCAttribute.h"
#import "SCCTag.h"
#import "SCCTrainer.h"
#import "SCCProgram.h"
#import "SCCProgramDynamicCell.h"

@interface SCCProgramSuggestionsListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray * programs;
@end

@implementation SCCProgramSuggestionsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    [self setProperties];
}
    
- (void)initProperties {
    UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 105, 44)];
    logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    logoImageView.image = [UIImage imageNamed:@"sweat-logo"];
    self.navigationItem.titleView = logoImageView;
}
    
- (void)setProperties {
    self.view.backgroundColor = UIColor.whiteColor;
    self.tableView.tableHeaderView = [self tableViewHeaderViewWithTitle:@"Program Suggestions"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:SCCProgramDynamicCell.getNib forCellReuseIdentifier:SCCProgramDynamicCell.reusedIdentifier];
}
    
#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.programs.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SCCProgramDynamicCell * cell = [tableView dequeueReusableCellWithIdentifier:SCCProgramDynamicCell.reusedIdentifier];
    [cell setupCell:self.programs[indexPath.row]];
    return cell;
}

#pragma mark - Custom Methods
- (UIView *)tableViewHeaderViewWithTitle:(NSString *)text {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(18, 20, SCREEN_WIDTH - 36, 24)];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont montserratBoldWithSize:20];
    label.numberOfLines = 0;
    label.text = text;
    [label resizeWidthWithFixedHeight];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetMaxY(label.frame) + 5)];
    [headerView addSubview:label];
    return headerView;
}



- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorColor = UIColor.clearColor;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableView];
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _tableView;
}


-(NSMutableArray *)programs{
    if(!_programs){
        _programs  = [NSMutableArray array];
        NSArray * dicts = [NSDictionary readLocalFileWithName:@"trainer-programs"];
        for (NSDictionary * dict in dicts) {
            SCCProgram *program = [[SCCProgram alloc]initWithDictionary:dict];
            NSMutableArray *tagNames = [NSMutableArray array];
            for (SCCTag* tag in program.tags) {
                [tagNames addObject:tag.name];
            }
            program.tagNames = tagNames;
            [_programs addObject:program];
        }
    }
    return _programs;
}

@end

