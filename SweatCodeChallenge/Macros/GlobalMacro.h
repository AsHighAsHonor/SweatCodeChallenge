//
//  GlobalMacro.h
//  SweatCodeChallenge
//
//  Created by Alvin He on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GlobalMacro : NSObject
    
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define MAS_SHORTHAND

#define SCC_GRAY [UIColor lightGrayColor]
#define CELL_SPE_COLOUR [UIColor colorWithHexString:@"C8C7CC"]
#define SCC_TEXT_GRAY [UIColor colorWithHexString:@"8A8A8A"]
#define SCC_BORDER_GRAY [UIColor colorWithHexString:@"BBBBBB"]
#define SCC_PINK [UIColor colorWithHexString:@"F8006F"]

@end
