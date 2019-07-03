//
//  DropsView.m
//  SweatCodeChallenge
//
//  Created by YYang1 on 2/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "DropsView.h"
#import "SCCAttribute.h"

@interface DropsView()
@property (nonatomic, strong) NSMutableArray *drops;
@property (nonatomic, strong) UIImageView *veriner;
@property (nonatomic, strong) SCCAttribute *attr;

@end


@implementation DropsView

- (instancetype)initWithDropValue:(SCCAttribute *)attr{
    self = [super init];
    if (self) {
        self.attr = attr;
        [self setupSubviewWithDropValue: attr];
    }
    return self;
}

-(void)setupSubviewWithDropValue:(SCCAttribute *)attr{
    __weak __typeof(self)weakSelf = self;
    for (NSInteger i = 1 ; i <=  attr.total.integerValue; i++) {
        UIImageView *image;
        if (i <= attr.value.integerValue){
            image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sweat-drop-filled"]];
        }else{
            image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sweat-drop"]];
        }
        [self addSubview:image];
        [image makeConstraints:^(MASConstraintMaker *make) {
            if (i == 1 ) {
                make.left.top.bottom.equalTo(weakSelf);
            }else{
                make.left.equalTo(weakSelf.veriner.mas_right);
                make.centerY.equalTo(weakSelf.veriner);
            }
            make.size.mas_equalTo(CGSizeMake(13, 18));
        }];
        
        self.veriner = image;

    }
}



@end
