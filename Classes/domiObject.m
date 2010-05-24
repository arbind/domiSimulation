//
//  domiObject.m
//  domiSimulation
//
//  Created by Arb on 5/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "domiObject.h"

NSString * const kDomiKey = @"domiKey";
NSString * const kDomiClass = @"domiClass";
NSString * const kDomiData = @"domiData";
NSString * const kDomiMetadata = @"domiMetadata";
NSString * const kName = @"name";
NSString * const kPreferences = @"preferences";
NSString * const kPrivateRepo = @"privateRepo";
NSString * const kAnonymousRepo = @"anonymousRepo";
NSString * const kPrivateRepoKey = @"pricateRepoKey";
NSString * const kAnonymousRepoKey = @"anonymouseRepoKey";
NSString * const kIPAddress = @"ipAddress";

@implementation domiObject

#pragma mark util
#pragma mark lifecycle

-(void) storeClassName {
	NSString *className = NSStringFromClass([self class]);
	[metadata setValue:className forKey:kDomiClass];
}


+(domiObject *) domiObjectFromJSONRepresentation:(NSString *)jsonRep {
	//extract metadata and data from JSON string
	NSDictionary *domiObjRep = [jsonRep JSONValue];
	NSDictionary *m = [[domiObjRep valueForKey:kDomiMetadata] retain];
	NSDictionary *d = [[domiObjRep valueForKey:kDomiData] retain];
	
	//get the domiClass
	NSString *className = [m valueForKey:kDomiClass];
	Class domiClass = NSClassFromString(className);
	
	//create an instance
	id obj = [[domiClass alloc] initWithMetadata:m andData:d];
	domiObject *domiObj = (domiObject *)obj;
	
	return domiObj;
}

-(id) init{
	self = [super init];
	if (!self) return nil;
	metadata = [[NSMutableDictionary alloc] init];
	data = [[NSMutableDictionary alloc] init];
	[self storeClassName];
	return self;
}

-(id) initWithMetadata:(NSDictionary*)m andData:(NSDictionary*)d {
	self = [super init];
	if (!self) return nil;
	metadata = [[NSMutableDictionary alloc] init];
	data = [[NSMutableDictionary alloc] init];
	[metadata addEntriesFromDictionary:m];
	[data addEntriesFromDictionary:d];
	[self storeClassName];
	return self;
}

-(void) dealloc {
	[metadata release];
	[data release];
	[super dealloc];
}

#pragma mark domiObject
-(id) metadataForKey:(NSString *)k {
	id value = [metadata objectForKey:k];
	return value;
}

-(void) setMetadata:(NSString *)value forKey:(NSString *)k{
	id v = value;
	if (nil==value) {
		[self removeMetadataForKey:k];
	}
	[metadata setValue:v forKey:k];
}

-(void) removeMetadataForKey:(NSString *)k {
	[metadata removeObjectForKey:k];
}

-(id) dataForKey:(NSString *)k {
	id value = [data objectForKey:k];
	return value;
}

-(void) setData:(id)value forKey:(NSString *)k{
	id v = value;
	if (nil==value) {
		[self removeDataForKey:k];
	}
	[data setValue:v forKey:k];
}

-(void) removeDataForKey:(NSString *)k {
	[data removeObjectForKey:k];
}

-(NSString *) domiKey {
	NSString *k = (NSString*)[self metadataForKey:kDomiKey];
	return k;
}

-(void) setDomiKey:(NSString*)key {
	[self setMetadata:key forKey:kDomiKey];
}

- (NSString *)JSONRepresentation {
	NSMutableDictionary *domiObj = [[NSMutableDictionary alloc] init];
	[domiObj setValue:metadata forKey:kDomiMetadata];
	[domiObj setValue:metadata forKey:kDomiData];
	NSString* jsonRep = [domiObj JSONRepresentation];
	return jsonRep;
}

@end
