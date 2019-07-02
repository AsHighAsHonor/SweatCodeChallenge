//
//	SCCTag.m
//	https://ashighashonor.github.io



#import "SCCTag.h"

NSString *const kSCCTagIdField = @"id";
NSString *const kSCCTagName = @"name";

@interface SCCTag ()
@end
@implementation SCCTag




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSCCTagIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kSCCTagIdField] integerValue];
	}

	if(![dictionary[kSCCTagName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kSCCTagName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kSCCTagIdField] = @(self.idField);
	if(self.name != nil){
		dictionary[kSCCTagName] = self.name;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:@(self.idField) forKey:kSCCTagIdField];	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kSCCTagName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [[aDecoder decodeObjectForKey:kSCCTagIdField] integerValue];
	self.name = [aDecoder decodeObjectForKey:kSCCTagName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SCCTag *copy = [SCCTag new];

	copy.idField = self.idField;
	copy.name = [self.name copy];

	return copy;
}
@end