//
//  UIView+Load.m
//  SweatCodeChallenge
//
//  Created by YYang1 on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "UIView+Load.h"

@implementation UIView (Load)

+ (instancetype)loadFromNib {
    id resultView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    return resultView;
}

+ (instancetype)loadFromNibWith:(CGRect)frame {
    id resultView = [self loadFromNib];
    [resultView setFrame:frame];
    return resultView;
}

+ (UINib *)getNib {
    return [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
}

+ (NSString *)reusedIdentifier {
    return NSStringFromClass(self);
}

- (void)addShadowWithColor:(UIColor *)color {

    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(0, 3);
    self.layer.shadowOpacity = 0.3;
    self.layer.shadowRadius = 5;
    self.layer.shadowColor = color.CGColor;
    self.layer.cornerRadius = 12;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = color.CGColor;

}

-(void)addShadowPathWith:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathWidth:(CGFloat)shadowPathWidth{
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius =  shadowRadius;
    self.layer.shadowOffset = CGSizeZero;
    CGRect shadowRect;
    CGFloat originX = 0;
    CGFloat originY = 0;
    CGFloat originW = self.bounds.size.width;
    CGFloat originH = self.bounds.size.height;
    shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY - shadowPathWidth/2, originW +  shadowPathWidth, originH + shadowPathWidth);
    UIBezierPath *path =[UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = path.CGPath;
    
}





@end
