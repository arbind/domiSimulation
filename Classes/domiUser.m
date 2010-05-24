//
//  domiUser.m
//  domiSimulation
//
//  Created by Arb on 5/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "domiUser.h"
#import "domiRepo.h"

@implementation domiUser
@synthesize privateRepo;

-(id) initWithUserName:(NSString *)userName andRepo:(domiRepo *)repo {
	self = [super init];
	if (!self) return nil;
	self.userName = userName;
	privateRepo = [repo retain];
	return self;
}


+ (domiUser*) userWithUserName:(NSString *)userName {
	domiRepo *repo = [domiRepo repoForUser:userName];
	if (nil==repo) return nil;
	domiUser *u = [[domiUser alloc] initWithUserName:userName andRepo:repo];
	return u;
}


-(NSString*) userName { return (NSString*)[self valueForKey:kName];  }
-(void) setUserName:(NSString *)s {[self setValue:s forKey:kName];  }

@end
