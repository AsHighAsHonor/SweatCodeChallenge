//
//	SCCProgram.m
//	https://ashighashonor.github.io



#import "SCCProgram.h"

NSString *const kSCCProgramAcronym = @"acronym";
NSString *const kSCCProgramAttributes = @"attributes";
NSString *const kSCCProgramCodeName = @"code_name";
NSString *const kSCCProgramIdField = @"id";
NSString *const kSCCProgramImage = @"image";
NSString *const kSCCProgramName = @"name";
NSString *const kSCCProgramTags = @"tags";
NSString *const kSCCProgramTrainer = @"trainer";

@interface SCCProgram ()
@end
@implementation SCCProgram




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSCCProgramAcronym] isKindOfClass:[NSNull class]]){
		self.acronym = dictionary[kSCCProgramAcronym];
	}	
	if(dictionary[kSCCProgramAttributes] != nil && [dictionary[kSCCProgramAttributes] isKindOfClass:[NSArray class]]){
		NSArray * attributesDictionaries = dictionary[kSCCProgramAttributes];
		NSMutableArray * attributesItems = [NSMutableArray array];
		for(NSDictionary * attributesDictionary in attributesDictionaries){
			SCCAttribute * attributesItem = [[SCCAttribute alloc] initWithDictionary:attributesDictionary];
			[attributesItems addObject:attributesItem];
		}
		self.attributes = attributesItems;
	}
	if(![dictionary[kSCCProgramCodeName] isKindOfClass:[NSNull class]]){
		self.codeName = dictionary[kSCCProgramCodeName];
	}	
	if(![dictionary[kSCCProgramIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kSCCProgramIdField] integerValue];
	}

	if(![dictionary[kSCCProgramImage] isKindOfClass:[NSNull class]]){
		self.image = dictionary[kSCCProgramImage];
	}	
	if(![dictionary[kSCCProgramName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kSCCProgramName];
	}	
	if(dictionary[kSCCProgramTags] != nil && [dictionary[kSCCProgramTags] isKindOfClass:[NSArray class]]){
		NSArray * tagsDictionaries = dictionary[kSCCProgramTags];
		NSMutableArray * tagsItems = [NSMutableArray array];
		for(NSDictionary * tagsDictionary in tagsDictionaries){
			SCCTag * tagsItem = [[SCCTag alloc] initWithDictionary:tagsDictionary];
			[tagsItems addObject:tagsItem];
		}
		self.tags = tagsItems;
	}
	if(![dictionary[kSCCProgramTrainer] isKindOfClass:[NSNull class]]){
		self.trainer = [[SCCTrainer alloc] initWithDictionary:dictionary[kSCCProgramTrainer]];
	}
    

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.acronym != nil){
		dictionary[kSCCProgramAcronym] = self.acronym;
	}
	if(self.attributes != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(SCCAttribute * attributesElement in self.attributes){
			[dictionaryElements addObject:[attributesElement toDictionary]];
		}
		dictionary[kSCCProgramAttributes] = dictionaryElements;
	}
	if(self.codeName != nil){
		dictionary[kSCCProgramCodeName] = self.codeName;
	}
	dictionary[kSCCProgramIdField] = @(self.idField);
	if(self.image != nil){
		dictionary[kSCCProgramImage] = self.image;
	}
	if(self.name != nil){
		dictionary[kSCCProgramName] = self.name;
	}
	if(self.tags != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(SCCTag * tagsElement in self.tags){
			[dictionaryElements addObject:[tagsElement toDictionary]];
		}
		dictionary[kSCCProgramTags] = dictionaryElements;
	}
	if(self.trainer != nil){
		dictionary[kSCCProgramTrainer] = [self.trainer toDictionary];
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
	if(self.acronym != nil){
		[aCoder encodeObject:self.acronym forKey:kSCCProgramAcronym];
	}
	if(self.attributes != nil){
		[aCoder encodeObject:self.attributes forKey:kSCCProgramAttributes];
	}
	if(self.codeName != nil){
		[aCoder encodeObject:self.codeName forKey:kSCCProgramCodeName];
	}
	[aCoder encodeObject:@(self.idField) forKey:kSCCProgramIdField];	if(self.image != nil){
		[aCoder encodeObject:self.image forKey:kSCCProgramImage];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kSCCProgramName];
	}
	if(self.tags != nil){
		[aCoder encodeObject:self.tags forKey:kSCCProgramTags];
	}
	if(self.trainer != nil){
		[aCoder encodeObject:self.trainer forKey:kSCCProgramTrainer];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.acronym = [aDecoder decodeObjectForKey:kSCCProgramAcronym];
	self.attributes = [aDecoder decodeObjectForKey:kSCCProgramAttributes];
	self.codeName = [aDecoder decodeObjectForKey:kSCCProgramCodeName];
	self.idField = [[aDecoder decodeObjectForKey:kSCCProgramIdField] integerValue];
	self.image = [aDecoder decodeObjectForKey:kSCCProgramImage];
	self.name = [aDecoder decodeObjectForKey:kSCCProgramName];
	self.tags = [aDecoder decodeObjectForKey:kSCCProgramTags];
	self.trainer = [aDecoder decodeObjectForKey:kSCCProgramTrainer];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SCCProgram *copy = [SCCProgram new];

	copy.acronym = [self.acronym copy];
	copy.attributes = [self.attributes copy];
	copy.codeName = [self.codeName copy];
	copy.idField = self.idField;
	copy.image = [self.image copy];
	copy.name = [self.name copy];
	copy.tags = [self.tags copy];
	copy.trainer = [self.trainer copy];

	return copy;
}
@end
