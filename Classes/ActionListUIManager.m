//
//  ActionListUIManager.m
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ActionListUIManager.h"


@implementation ActionListUIManager

-(void) populateActionList {
	NSMutableArray *actions = [[NSMutableArray alloc] init];
	[actions addObject:@"act 1"];
	[actions addObject:@"act 2"];
	[actions addObject:@"act 3"];
	[actions addObject:@"act 4"];
	
	[actionManager populateList:actions];		
}

-(id) initWithTable:(UITableView *)t {
	self = [super init];
	if (!self) return nil;
	
	SEL s = @selector(description);
	actionManager = [[TableViewSelectListManager alloc] initWithTable:t keySelector:s andDelegate:self];	
	[actionManager setSectionHeader:@"Actions"];
	
	[self populateActionList];
	return self;
}

-(void) reloadData {
	[actionManager reloadData];
}

-(BOOL) isMultiSelectable {
	return actionManager.isMultiSelectable ;
}

-(void) setMultiSelectable:(BOOL)b {
	actionManager.multiSelectable=b;
}

@end
