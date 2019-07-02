//
//  UILabel+Style.m
//  SweatCodeChallenge
//
//  Created by Alvin He on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "UILabel+Style.h"

@implementation UILabel(Style)
    
- (void)resizeHeightWithFixedWidth {
    [self resizeHeightWithFixedWidthAndExtraHeight:0];
}
    
- (void)resizeWidthWithFixedHeight {
    [self resizeWidthWithFixedHeightAndExtraWidth:0];
}
    
- (void)resizeHeightWithFixedWidthAndExtraHeight:(CGFloat)extraHeight {
    self.numberOfLines = 0;
    CGRect oldFrame = self.frame;
    oldFrame.size.height += 1000.0;
    [self sizeToFit];
    CGRect newFrame = self.frame;
    [self setFrame:CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, newFrame.size.height+extraHeight)];
}
    
- (void)resizeWidthWithFixedHeightAndExtraWidth:(CGFloat)extraWidth {
    self.numberOfLines = 0;
    CGRect oldFrame = self.frame;
    oldFrame.size.width += 1000.0;
    [self setFrame:oldFrame];
    [self sizeToFit];
    CGRect newFrame = self.frame;
    [self setFrame:CGRectMake(oldFrame.origin.x, oldFrame.origin.y, newFrame.size.width+extraWidth, oldFrame.size.height)];
}
    
@end
