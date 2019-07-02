//
//  UIView+Load.h
//  SweatCodeChallenge
//
//  Created by YYang1 on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface UIView (Load)
+ (instancetype)loadFromNib;
+ (instancetype)loadFromNibWith:(CGRect)frame;
+ (UINib *)getNib;
+ (NSString *)reusedIdentifier;

- (void)addShadowWithColor:(UIColor *)theColor;
-(void)addShadowPathWith:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathWidth:(CGFloat)shadowPathWidth;
@end

NS_ASSUME_NONNULL_END
