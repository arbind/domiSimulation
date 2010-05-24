//
//  UserListUIManager.m
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserListUIManager.h"
#import "domiUser.h"
#import "domiAppConfig.h"

@implementation UserListUIManager

-(void) populateUserList{
	domiAppConfig * appConfig = [domiAppConfig getInstance];
	NSArray *userList = [appConfig localUsers];
	
	[userManager populateList:userList];
}

-(id) initWithTable:(UITableView *)t {
	self = [super init];
	if (!self) return nil;	
	
	SEL s = @selector(userName);
	userManager = [[TableViewSelectListManager alloc] initWithTable:t keySelector:s andDelegate:self];	
	[userManager setSectionHeader:@"Users"];
	
	userManager.multiSelectable = NO;
	
	[self populateUserList];
	
	return self;
}

-(void) reloadData {
	[self populateUserList];
}

-(BOOL) isMultiSelectable {
	return userManager.isMultiSelectable ;
}

-(void) setMultiSelectable:(BOOL)b {
	userManager.multiSelectable=b;
}

@end
