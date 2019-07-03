//
//  NSDictionary+Json.h
//  SweatCodeChallenge
//
//  Created by YYang1 on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Json)

+ (id)readLocalFileWithName:(NSString *)name;

@end
