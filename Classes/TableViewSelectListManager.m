//
//  TableViewSelectListManager.m
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TableViewSelectListManager.h"

@implementation TableViewSelectListManager
@synthesize multiSelectable,uiTableView, sectionHeader, delegate;


-(id) keyForItem:(id)item {
	id key = [item performSelector:keySelector];
	return key;
}

-(id) initWithTable:(UITableView *)t keySelector:(SEL)selector andDelegate:(id<TableViewSelectListManagerDelegate>)d {
	self = [super init];
	if (!self) return nil;

	multiSelectable = YES;
	
	keySelector = selector;
	delegate = [d retain];
	uiTableView = [t retain];
	uiTableView.delegate = self;
	uiTableView.dataSource = self;

		
	list = [[[NSMutableArray alloc] init] retain];
	selections = [[[NSMutableDictionary alloc] init] retain];
	return self;
}



-(void)populateList:(NSArray *)replacementList {
	[list removeAllObjects];
	[list addObjectsFromArray:replacementList];
	
	//unselect any items that were removeds
	if (0==[selections count]) return;
	
	NSMutableArray *removeList = [[NSMutableArray alloc] init];
	id key;
	for (id item in list) {
		key = [self keyForItem:item];
		if (nil==key) [removeList addObject:key];
	}
	for(id k in removeList) {
		[selections removeObjectForKey:k];
	}
	
	[uiTableView reloadData];
}

-(NSArray *)selectedItems {
	if (0==[selections count]) return nil;
	
	NSMutableArray *selected = [[NSMutableArray alloc] init];
	id key;
	for (id item in list) {
		key = [self keyForItem:item];
		if (nil!=[selections objectForKey:key]) {
			[selected addObject:item];
		}
	}
	return selected;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return self.sectionHeader;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
	return [list count];
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	//if delegate implements cellForRowAtIndexPath and it does not return nil.. use that cell
	
	static NSString *CellIdentifier = @"TableViewSelectListManagerCellIdentifier";
	
	// Dequeue or create a cell of the appropriate type.
	UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	id item = [list objectAtIndex:indexPath.row];
	id key = [self keyForItem:item];
	if (nil==[selections objectForKey:key]) {
		cell.accessoryType =  UITableViewCellAccessoryNone;
	}
	else {
		cell.accessoryType =  UITableViewCellAccessoryCheckmark;		
	}
	cell.textLabel.text = key;
	return cell;
}


-(void) unselectEverything {
	if (0==[selections count]) return;
	UITableViewCell *cell;
	id item;
	for (id key in selections) {
		item = [selections objectForKey:key];
		int idx = [list indexOfObject:item];
		NSUInteger pathSource[2] = {0, idx};
		NSIndexPath *path = [NSIndexPath indexPathWithIndexes:pathSource length:2];
		cell = [uiTableView cellForRowAtIndexPath:path];
		cell.accessoryType =  UITableViewCellAccessoryNone;
	}
	[selections removeAllObjects];
}

#pragma mark -
#pragma mark Table view selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	id item = [list objectAtIndex:indexPath.row];
	id key = [self keyForItem:item];
	if (nil==[selections valueForKey:key]) {
		if (NO==multiSelectable) {
			[self unselectEverything];
		}
		[selections setObject:item forKey:key];
		cell.accessoryType =  UITableViewCellAccessoryCheckmark;
		//+++ todo:if responds to selector [delegate itemWasSelected:item];
	}
	else {
		[selections removeObjectForKey:key];
		cell.accessoryType =  UITableViewCellAccessoryNone;
		//+++ todo:if responds to selector [delegate itemWasUnSelected:item];
	}	
}

@end
