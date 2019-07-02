#import <UIKit/UIKit.h>

@interface SCCTag : NSObject

@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end