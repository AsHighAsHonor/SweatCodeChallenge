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


@interface SCCProgramDynamicCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trainerBottomConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *trainerImageView;
@property(nonatomic, strong) DropsView *drop;
@property(nonatomic, strong) SCCAttributeView * attrView;
@property(nonatomic, strong)UIView *vernier;
@property (weak, nonatomic) IBOutlet UILabel *programNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *trainerNameLabel;
@property (weak, nonatomic) IBOutlet UIView *frameView;
@property(nonatomic, strong)TTGTextTagCollectionView * collectionView;
@property(nonatomic, strong)NSMutableArray <SCCTag *> *tags;
@property(nonatomic, strong)TTGTextTagConfig *config;

@end


@implementation SCCProgramDynamicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.frameView addShadowWithColor:SCC_BORDER_GRAY];
    
}
-(void)prepareForReuse{
    [super prepareForReuse];
    [self.collectionView removeAllTags];
}


-(void)setupCell:(SCCProgram *)program{
    __weak __typeof(self)weakSelf = self;
    [self.trainerImageView sd_setImageWithURL:[NSURL URLWithString:program.trainer.imageUrl]];
    
    for (int i = 0 ; i< program.attributes.count; i++) {
        SCCAttribute * attr = program.attributes[i];
        UIView * temp;
        if ([attr.codeName isEqualToString:@"intensity"]){
            temp = [[DropsView alloc]initWithDropValue:attr];
        }else{
            temp  = SCCAttributeView.loadFromNib;
            [(SCCAttributeView* )temp setupAttribute: attr];
        }
        [self.contentView addSubview:temp];
        [temp makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0){
                make.top.equalTo(weakSelf.trainerNameLabel.mas_bottom).offset(5);
            }else{
                make.top.equalTo(weakSelf.vernier.mas_bottom).offset(5);
            }
            make.left.equalTo(weakSelf.contentView).offset(36);
            make.right.equalTo(weakSelf.trainerImageView.mas_left).offset(0);
            
        }];
        
        self.vernier = temp;
    }
    
    [self.contentView layoutIfNeeded];
    [self.collectionView addTags: program.tagNames withConfig:self.config];
    [self.contentView layoutIfNeeded];
}


-(TTGTextTagCollectionView *)collectionView{
    if(!_collectionView){
        __weak __typeof(self)weakSelf = self;
        _collectionView  = [[TTGTextTagCollectionView alloc]initWithFrame:CGRectZero];
        _collectionView.alignment = TTGTagCollectionAlignmentFillByExpandingWidth;
        _collectionView.enableTagSelection = NO;
        _collectionView.alignment = TTGTagCollectionAlignmentFillByExpandingWidthExceptLastLine;
        [self.contentView addSubview:self.collectionView];
        [self.collectionView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.vernier.bottom).offset(25);
            make.left.equalTo(weakSelf.contentView).offset(36);
            make.bottom.equalTo(weakSelf.contentView.bottom).offset(-25);
            make.right.equalTo(weakSelf.trainerImageView.left);
        }];

    }
    return _collectionView;
}


-(NSMutableArray *)tags{
    if(!_tags){
        _tags  = [NSMutableArray array];
    }
    return _tags;
}



-(TTGTextTagConfig *)config{
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
