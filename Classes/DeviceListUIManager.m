//
//  DeviceTableView.m
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DeviceListUIManager.h"
#import "domiDevice.h"

@implementation DeviceListUIManager

-(void) populateDeviceList{
	NSMutableArray *deviceList = [[NSMutableArray alloc] init];
	domiDevice *device;
	device = [[domiDevice alloc] init]; [device setName:@"dev 1"];
	[deviceList addObject:device]; [device release];

	device = [[domiDevice alloc] init]; [device setName:@"dev 2"];
	[deviceList addObject:device]; [device release];

	device = [[domiDevice alloc] init]; [device setName:@"dev 3"];
	[deviceList addObject:device]; [device release];

	device = [[domiDevice alloc] init]; [device setName:@"dev 4"];
	[deviceList addObject:device]; [device release];

	[deviceManager populateList:deviceList];
}

-(id) initWithTable:(UITableView *)t {
	self = [super init];
	if (!self) return nil;	
	
	SEL s = @selector(name);
	deviceManager = [[TableViewSelectListManager alloc] initWithTable:t keySelector:s andDelegate:self];	
	[deviceManager setSectionHeader:@"Devices"];
	
	[self populateDeviceList];
	
	return self;
}

-(void) reloadData {
	[deviceManager reloadData];
}

-(BOOL) isMultiSelectable {
	return deviceManager.isMultiSelectable ;
}

-(void) setMultiSelectable:(BOOL)b {
	deviceManager.multiSelectable=b;
}


@end
