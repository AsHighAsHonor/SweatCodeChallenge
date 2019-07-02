//
//  SCCTableViewCell.m
//  SweatCodeChallenge
//
//  Created by YYang1 on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "SCCTableViewCell.h"
@interface SCCTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *programNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *trainerNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *trainerImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstAttrLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondAttrLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdAttrLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourthAttrLabel;

@property (weak, nonatomic) IBOutlet UIProgressView *firstProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *secondProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *thirdProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *fourthProgress;



@end


@implementation SCCTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
