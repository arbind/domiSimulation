//
//  ActionListUIManager.h
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewSelectListManager.h"

@interface ActionListUIManager : TableViewSelectListManager <TableViewSelectListManagerDelegate> {

	TableViewSelectListManager *actionManager;
}

-(id) initWithTable:(UITableView *)t;

@end
