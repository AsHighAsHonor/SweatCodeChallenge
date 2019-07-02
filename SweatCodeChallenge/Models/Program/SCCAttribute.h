#import <UIKit/UIKit.h>

@interface SCCAttribute : NSObject

@property (nonatomic, strong) NSString * codeName;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * total;
@property (nonatomic, strong) NSString * value;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end