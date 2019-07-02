#import <UIKit/UIKit.h>
#import "SCCAttribute.h"
#import "SCCTag.h"
#import "SCCTrainer.h"

@interface SCCProgram : NSObject

@property (nonatomic, strong) NSString * acronym;
@property (nonatomic, strong) NSArray * attributes;
@property (nonatomic, strong) NSString * codeName;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSArray * tags;
@property (nonatomic, strong) SCCTrainer * trainer;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end