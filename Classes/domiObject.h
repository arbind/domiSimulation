//
//  domiObject.h
//  domiSimulation
//
//  Created by Arb on 5/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"

@interface domiObject : NSObject {
	@public
	NSMutableDictionary *metadata;
	NSMutableDictionary *data;
}

@property (nonatomic, retain) NSString *domiKey;

+(domiObject *) domiObjectFromJSONRepresentation:(NSString *)jsonRep;

-(id) init;
-(id) initWithMetadata:(NSDictionary*)m andData:(NSDictionary*)d;

-(id) metadataForKey:(NSString *)k;
-(void) setMetadata:(id)value forKey:(NSString *)k;
-(void) removeMetadataForKey:(NSString *)k;

-(id) dataForKey:(NSString *)k;
-(void) setData:(id)value forKey:(NSString *)k;
-(void) removeDataForKey:(NSString *)k;

- (NSString *)JSONRepresentation;

@end

extern NSString * const kDomiKey;
extern NSString * const kDomiClass;
extern NSString * const kDomiData;
extern NSString * const kDomiMetadata;

extern NSString * const kName;
extern NSString * const kPreferences;
extern NSString * const kPrivateRepo;
extern NSString * const kAnonymousRepo;
extern NSString * const kPrivateRepoKey;
extern NSString * const kAnonymousRepoKey;
extern NSString * const kIPAddress;

