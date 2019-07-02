//
//
//  SweatCodeChallenge
//
//  Created by YYang1 on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCCAttribute.h"
#import "SCCTag.h"
#import "SCCTrainer.h"

@interface SCCProgram : NSObject

@property (nonatomic, strong) NSString * acronym;
@property (nonatomic, strong) NSArray<SCCAttribute *> * attributes;
@property (nonatomic, strong) NSString * codeName;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSArray<SCCTag*> * tags;
@property (nonatomic, strong) SCCTrainer * trainer;
@property (nonatomic, strong)NSMutableArray *tagNames;


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
