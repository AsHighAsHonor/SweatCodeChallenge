//
//  SCCProgramDynamicCell.m
//  SweatCodeChallenge
//
//  Created by YYang1 on 2/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "SCCProgramDynamicCell.h"
#import "SCCAttribute.h"
#import "SCCTag.h"
#import "SCCTrainer.h"
#import "SCCProgram.h"
#import "DropsView.h"
#import "SCCAttributeView.h"
#import "TTGTextTagCollectionView.h"


static NSString *const IntensityCode = @"intensity";

@interface SCCProgramDynamicCell ()
@property (nonatomic, strong) UIView *vernier;
@property (weak, nonatomic) IBOutlet UIImageView *trainerImageView;
@property (weak, nonatomic) IBOutlet UILabel *programNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *trainerNameLabel;
@property (weak, nonatomic) IBOutlet UIView *frameView;
@property (nonatomic, strong) IBOutlet TTGTextTagCollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray <SCCTag *> *tags;
@property (nonatomic, strong) TTGTextTagConfig *config;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewConstraint;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation SCCProgramDynamicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.collectionView.alignment = TTGTagCollectionAlignmentFillByExpandingWidth;
    self.collectionView.enableTagSelection = NO;
    self.collectionView.alignment = TTGTagCollectionAlignmentLeft;
    [self.frameView addShadowWithColor:SCC_BORDER_GRAY];
}
- (void)prepareForReuse {
    [super prepareForReuse];
    self.vernier = nil;
    [self.containerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.collectionView removeAllTags];
}

- (void)setupCell:(SCCProgram *)program {
    __weak __typeof(self)weakSelf = self;
    [self.trainerImageView sd_setImageWithURL:[NSURL URLWithString:program.trainer.imageUrl]];
    CGFloat height = 0;
    for (int i = 0 ; i< program.attributes.count; i++) {
        SCCAttribute * attr = program.attributes[i];
        UIView * temp;
        if ([attr.codeName isEqualToString:IntensityCode]){
            temp = [[DropsView alloc]initWithDropValue:attr];
            height += 18;
        }else{
            temp  = SCCAttributeView.loadFromNib;
            [(SCCAttributeView* )temp setupAttribute: attr];
            height += 35;
        }
        [self.containerView addSubview:temp];
        [temp makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0){
                make.top.equalTo(weakSelf.containerView);
            }else if(i == (program.attributes.count +1)){
                make.bottom.equalTo(weakSelf.containerView.bottom);
            }else{
                make.top.equalTo(weakSelf.vernier.mas_bottom).offset(7);
            }
            make.left.equalTo(weakSelf.containerView);
            make.right.equalTo(weakSelf.containerView);
            
        }];
        //Vernier use for add constraint to next view
        self.vernier = temp;
    }
    
    self.containerViewConstraint.constant = height;
    [self.collectionView addTags: program.tagNames withConfig:self.config];
    [self.contentView setNeedsUpdateConstraints];
    [self.contentView updateConstraintsIfNeeded];
}

#pragma mark - LazyProperty
- (NSMutableArray *)tags {
    if(!_tags){
        _tags  = [NSMutableArray array];
    }
    return _tags;
}

- (TTGTextTagConfig *)config {
    if(!_config){
        _config  = [[TTGTextTagConfig alloc]init];
        _config.textFont = [UIFont openSansSemiboldWithSize:8];
        _config.backgroundColor = UIColor.whiteColor;
        _config.borderColor = SCC_BORDER_GRAY;
        _config.borderWidth = 0.5;
        _config.shadowColor = UIColor.clearColor;
        _config.textColor = SCC_TEXT_GRAY;
        _config.extraSpace = CGSizeMake(6, 10);
    }
    return _config;
}

@end
