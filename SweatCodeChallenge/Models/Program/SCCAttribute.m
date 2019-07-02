//
//
//  SweatCodeChallenge
//
//  Created by YYang1 on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//



#import "SCCAttribute.h"

NSString *const kSCCAttributeCodeName = @"code_name";
NSString *const kSCCAttributeIdField = @"id";
NSString *const kSCCAttributeName = @"name";
NSString *const kSCCAttributeTotal = @"total";
NSString *const kSCCAttributeValue = @"value";

@interface SCCAttribute ()
@end
@implementation SCCAttribute




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSCCAttributeCodeName] isKindOfClass:[NSNull class]]){
		self.codeName = dictionary[kSCCAttributeCodeName];
	}	
	if(![dictionary[kSCCAttributeIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kSCCAttributeIdField] integerValue];
	}

	if(![dictionary[kSCCAttributeName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kSCCAttributeName];
	}	
	if(![dictionary[kSCCAttributeTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kSCCAttributeTotal];
	}	
	if(![dictionary[kSCCAttributeValue] isKindOfClass:[NSNull class]]){
		self.value = dictionary[kSCCAttributeValue];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.codeName != nil){
		dictionary[kSCCAttributeCodeName] = self.codeName;
	}
	dictionary[kSCCAttributeIdField] = @(self.idField);
	if(self.name != nil){
		dictionary[kSCCAttributeName] = self.name;
	}
	if(self.total != nil){
		dictionary[kSCCAttributeTotal] = self.total;
	}
	if(self.value != nil){
		dictionary[kSCCAttributeValue] = self.value;
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
	if(self.codeName != nil){
		[aCoder encodeObject:self.codeName forKey:kSCCAttributeCodeName];
	}
	[aCoder encodeObject:@(self.idField) forKey:kSCCAttributeIdField];	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kSCCAttributeName];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kSCCAttributeTotal];
	}
	if(self.value != nil){
		[aCoder encodeObject:self.value forKey:kSCCAttributeValue];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.codeName = [aDecoder decodeObjectForKey:kSCCAttributeCodeName];
	self.idField = [[aDecoder decodeObjectForKey:kSCCAttributeIdField] integerValue];
	self.name = [aDecoder decodeObjectForKey:kSCCAttributeName];
	self.total = [aDecoder decodeObjectForKey:kSCCAttributeTotal];
	self.value = [aDecoder decodeObjectForKey:kSCCAttributeValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SCCAttribute *copy = [SCCAttribute new];

	copy.codeName = [self.codeName copy];
	copy.idField = self.idField;
	copy.name = [self.name copy];
	copy.total = [self.total copy];
	copy.value = [self.value copy];

	return copy;
}
@end
