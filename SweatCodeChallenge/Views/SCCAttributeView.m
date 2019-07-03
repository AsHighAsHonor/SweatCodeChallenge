//
//  SCCAttributeView.m
//  SweatCodeChallenge
//
//  Created by YYang1 on 2/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "SCCAttributeView.h"
#import "SCCAttribute.h"



@interface SCCAttributeView()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation SCCAttributeView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.progressView.layer setCornerRadius:4];
    [self.progressView.layer setMasksToBounds:YES];
    self.progressView.layer.borderWidth = 0.5;
    self.progressView.layer.borderColor = SCC_BORDER_GRAY.CGColor;
    self.nameLabel.font = [UIFont openSansSemiboldWithSize:12];
    self.nameLabel.textColor = SCC_TEXT_GRAY;
    
    //Set progress view's track view round corner
    [self.progressView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.layer.masksToBounds = YES;
        obj.layer.cornerRadius = 4;
    }];
    
}

-(void)setupAttribute:(SCCAttribute*)attribute{
    self.nameLabel.text = attribute.name;
    if (![NSString isBlankString:attribute.value] && ![NSString isBlankString:attribute.total]) {
        self.progressView.progress = attribute.value.doubleValue / attribute.total.doubleValue;
    }
    
}





@end
