//
//  UIFont+Custom.m
//  SweatCodeChallenge
//
//  Created by Alvin He on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "UIFont+Custom.h"

@implementation UIFont(Custom)

+ (instancetype)montserratBoldWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"Montserrat-Bold" size:size];
}
    
+ (instancetype)openSansBoldWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"OpenSans-Bold" size:size];
}
    
+ (instancetype)openSansSemiboldWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"OpenSans-Semibold" size:size];
}
    
@end
