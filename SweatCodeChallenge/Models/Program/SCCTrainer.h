#import <UIKit/UIKit.h>

@interface SCCTrainer : NSObject

@property (nonatomic, strong) NSString * codeName;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * imageUrl;
@property (nonatomic, strong) NSString * name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end