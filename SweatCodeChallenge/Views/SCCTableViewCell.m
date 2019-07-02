//
//  SCCTableViewCell.m
//  SweatCodeChallenge
//
//  Created by YYang1 on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "SCCTableViewCell.h"
#import "SCCAttribute.h"
#import "SCCTag.h"
#import "SCCTrainer.h"
#import "SCCProgram.h"


@interface SCCTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UILabel *programNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *trainerNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *trainerImageView;

@property (weak, nonatomic) IBOutlet UILabel *firstAttrLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondAttrLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdAttrLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourthAttrLabel;

@property (nonatomic, strong) NSMutableArray *progressBars;
@property (weak, nonatomic) IBOutlet UIProgressView *firstProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *secondProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *thirdProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *fourthProgress;

@property (nonatomic, strong) NSMutableArray <UIImageView* >* drops;
@property (weak, nonatomic) IBOutlet UIImageView *drop1;
@property (weak, nonatomic) IBOutlet UIImageView *drop2;
@property (weak, nonatomic) IBOutlet UIImageView *drop3;
@property (weak, nonatomic) IBOutlet UIImageView *drop4;
@property (weak, nonatomic) IBOutlet UIImageView *drop5;

@property (nonatomic, strong) NSMutableArray *tags;
@property (weak, nonatomic) IBOutlet UILabel *tag1;
@property (weak, nonatomic) IBOutlet UILabel *tag2;
@property (weak, nonatomic) IBOutlet UILabel *tag3;
@property (weak, nonatomic) IBOutlet UILabel *tag4;
@property (weak, nonatomic) IBOutlet UILabel *tag5;
@property (weak, nonatomic) IBOutlet UILabel *tag6;
@property (weak, nonatomic) IBOutlet UILabel *tag7;
@property (weak, nonatomic) IBOutlet UILabel *tag8;



@end


@implementation SCCTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.containerView.layer setCornerRadius:12];
    self.containerView.layer.borderWidth = 0.5;
    self.containerView.layer.borderColor = CELL_SPE_COLOUR.CGColor;
    [self.containerView addShadowPathWith:SCC_GRAY shadowOpacity:0.3 shadowRadius:9 shadowPathWidth:5];
    
    for (UIProgressView * bar in self.progressBars) {
        [bar.layer setCornerRadius:4];
        [bar.layer setMasksToBounds:YES];
        bar.layer.borderWidth = 0.5;
        bar.layer.borderColor = CELL_SPE_COLOUR.CGColor;
        [bar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.layer.masksToBounds = YES;
            obj.layer.cornerRadius = 4;
        }];
    }
    for (UILabel* tag in self.tags) {
        [tag.layer setCornerRadius:4];
        [tag.layer setMasksToBounds:YES];
        tag.layer.borderWidth = 0.5;
        tag.layer.borderColor = CELL_SPE_COLOUR.CGColor;
    }

    
}

-(void)setupCell:(SCCProgram *)program{
    self.programNameLabel.text = program.name;
    self.trainerNameLabel.text = program.trainer.name;
    
    self.firstAttrLabel.text = program.attributes[1].name;
    self.secondAttrLabel.text = program.attributes[2].name;
    self.thirdAttrLabel.text = program.attributes[3].name;
    self.fourthAttrLabel.text = program.attributes[4].name;
    
    self.firstProgress.progress = program.attributes[1].value.doubleValue / program.attributes[1].total.doubleValue;
    self.secondProgress.progress = program.attributes[2].value.doubleValue / program.attributes[2].total.doubleValue;
    self.thirdProgress.progress = program.attributes[3].value.doubleValue / program.attributes[3].total.doubleValue;
    self.fourthProgress.progress = program.attributes[4].value.doubleValue /  program.attributes[4].total.doubleValue;
    
    [self.trainerImageView sd_setImageWithURL:[NSURL URLWithString:program.trainer.imageUrl]];

    [self.drops enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ((idx + 1) < program.attributes.firstObject.value.integerValue){
            [obj setImage:[UIImage imageNamed:@"sweat-drop-filled"]];
        }else{
            [obj setImage:[UIImage imageNamed:@"sweat-drop"]];
            
        }
    }];
    __weak __typeof(self)weakSelf = self;
    [program.tags enumerateObjectsUsingBlock:^(SCCTag * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel* lab = weakSelf.tags[idx];
        lab.text = [NSString stringWithFormat:@" %@ ",obj.name];
        lab.hidden = NO;
    }];
    
    
    
    
}



-(NSMutableArray *)drops{
    if(!_drops){
        _drops  = @[self.drop1, self.drop2, self.drop3, self.drop4, self.drop5].mutableCopy;
    }
    return _drops;
}


-(NSMutableArray *)progressBars{
    if(!_progressBars){
        _progressBars  = @[self.firstProgress, self.secondProgress, self.thirdProgress, self.fourthProgress].mutableCopy;
    }
    return _progressBars;
}


-(NSMutableArray *)tags{
    if(!_tags){
        _tags  = @[self.tag1, self.tag2, self.tag3, self.tag4, self.tag5, self.tag6, self.tag7, self.tag8].mutableCopy
        ;
    }
    return _tags;
}

@end
