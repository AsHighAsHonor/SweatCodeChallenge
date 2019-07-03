//
//	SCCTrainer.m
//	https://ashighashonor.github.io



#import "SCCTrainer.h"

NSString *const kSCCTrainerCodeName = @"code_name";
NSString *const kSCCTrainerIdField = @"id";
NSString *const kSCCTrainerImageUrl = @"image_url";
NSString *const kSCCTrainerName = @"name";

@interface SCCTrainer ()
@end
@implementation SCCTrainer

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	self = [super init];
	if(![dictionary[kSCCTrainerCodeName] isKindOfClass:[NSNull class]]){
		self.codeName = dictionary[kSCCTrainerCodeName];
	}	
	if(![dictionary[kSCCTrainerIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kSCCTrainerIdField] integerValue];
	}

	if(![dictionary[kSCCTrainerImageUrl] isKindOfClass:[NSNull class]]){
		self.imageUrl = dictionary[kSCCTrainerImageUrl];
	}	
	if(![dictionary[kSCCTrainerName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kSCCTrainerName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (NSDictionary *)toDictionary {
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.codeName != nil){
		dictionary[kSCCTrainerCodeName] = self.codeName;
	}
	dictionary[kSCCTrainerIdField] = @(self.idField);
	if(self.imageUrl != nil){
		dictionary[kSCCTrainerImageUrl] = self.imageUrl;
	}
	if(self.name != nil){
		dictionary[kSCCTrainerName] = self.name;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder {
	if(self.codeName != nil){
		[aCoder encodeObject:self.codeName forKey:kSCCTrainerCodeName];
	}
	[aCoder encodeObject:@(self.idField) forKey:kSCCTrainerIdField];	if(self.imageUrl != nil){
		[aCoder encodeObject:self.imageUrl forKey:kSCCTrainerImageUrl];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kSCCTrainerName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	self.codeName = [aDecoder decodeObjectForKey:kSCCTrainerCodeName];
	self.idField = [[aDecoder decodeObjectForKey:kSCCTrainerIdField] integerValue];
	self.imageUrl = [aDecoder decodeObjectForKey:kSCCTrainerImageUrl];
	self.name = [aDecoder decodeObjectForKey:kSCCTrainerName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone {
	SCCTrainer *copy = [SCCTrainer new];

	copy.codeName = [self.codeName copy];
	copy.idField = self.idField;
	copy.imageUrl = [self.imageUrl copy];
	copy.name = [self.name copy];

	return copy;
}
@end
