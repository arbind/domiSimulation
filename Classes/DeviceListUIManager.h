//
//  DeviceTableView.h
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TableViewSelectListManager.h"

@interface DeviceListUIManager : NSObject <TableViewSelectListManagerDelegate> {
	TableViewSelectListManager *deviceManager;
}

-(id) initWithTable:(UITableView *)t;

@end
