//
//  UserListUIManager.h
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewSelectListManager.h"

@interface UserListUIManager : NSObject  <TableViewSelectListManagerDelegate> {
	TableViewSelectListManager *userManager;
}

@property (assign, getter=isMultiSelectable) BOOL multiSelectable;

-(id) initWithTable:(UITableView *)t;

@end