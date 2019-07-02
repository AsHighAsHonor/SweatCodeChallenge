//
//  UILabel+Style.h
//  SweatCodeChallenge
//
//  Created by Alvin He on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UILabel(Style)

- (void)resizeHeightWithFixedWidth;

- (void)resizeWidthWithFixedHeight;
    
- (void)resizeHeightWithFixedWidthAndExtraHeight:(CGFloat)extraHeight;
    
- (void)resizeWidthWithFixedHeightAndExtraWidth:(CGFloat)extraWidth;

@end
