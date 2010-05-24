//
//  ToplogySimulationViewControllerIPHONE.h
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimulationViewControllerIPHONE.h"
#import "UserListUIManager.h"
#import "DeviceListUIManager.h"
#import "ActionListUIManager.h"

@interface TopologySimulationViewControllerIPHONE : SimulationViewControllerIPHONE<TableViewSelectListManagerDelegate> {

	UITableView *usersTableView;
	UITableView *devicesTableView;
	UITableView *actionsTableView;
	
	DeviceListUIManager *userManager;
	DeviceListUIManager *deviceManager;
	ActionListUIManager *actionManager;
}

@property (nonatomic, retain) IBOutlet UITableView *usersTableView;
@property (nonatomic, retain) IBOutlet UITableView *devicesTableView;
@property (nonatomic, retain) IBOutlet UITableView *actionsTableView;

@end
