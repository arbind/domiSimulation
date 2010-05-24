//
//  UserListUIManager.m
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserListUIManager.h"
#import "domiUser.h"

@implementation UserListUIManager

-(void) populateUserList{
	NSMutableArray *userList = [[NSMutableArray alloc] init];
	domiUser *user;
	user = [[domiUser alloc] init]; [user setName:@"User1"];
	[userList addObject:user]; [user release];
	
	user = [[domiUser alloc] init]; [user setName:@"User2"];
	[userList addObject:user]; [user release];
	
	user = [[domiUser alloc] init]; [user setName:@"User3"];
	[userList addObject:user]; [user release];
	
	user = [[domiUser alloc] init]; [user setName:@"User4"];
	[userList addObject:user]; [user release];
	
	user = [[domiUser alloc] init]; [user setName:@"User5"];
	[userList addObject:user]; [user release];
	
	user = [[domiUser alloc] init]; [user setName:@"User6"];
	[userList addObject:user]; [user release];
	
	[userManager populateList:userList];
}

-(id) initWithTable:(UITableView *)t {
	self = [super init];
	if (!self) return nil;	
	
	SEL s = @selector(name);
	userManager = [[TableViewSelectListManager alloc] initWithTable:t keySelector:s andDelegate:self];	
	[userManager setSectionHeader:@"Users"];
	
	userManager.multiSelectable = NO;
	
	[self populateUserList];
	
	return self;
}

-(BOOL) isMultiSelectable {
	return userManager.isMultiSelectable ;
}

-(void) setMultiSelectable:(BOOL)b {
	userManager.multiSelectable=b;
}

@end
