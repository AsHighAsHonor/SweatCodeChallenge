//
//  NSString+Category.m
//  SweatCodeChallenge
//
//  Created by YYang1 on 3/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
@end
