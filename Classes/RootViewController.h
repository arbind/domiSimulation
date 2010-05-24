//
//  RootViewController.h
//  domiSimulation
//
//  Created by Arb on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimulationViewController.h"

#if defined IPAD
@interface RootViewController : UITableViewController <UISplitViewControllerDelegate> {
	
	UISplitViewController *splitViewController;
	
	UIPopoverController *popoverController;    
	UIBarButtonItem *rootPopoverButtonItem;
@private
	NSMutableArray *simuationControllers;
}

@property (nonatomic, assign) IBOutlet UISplitViewController *splitViewController;

@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UIBarButtonItem *rootPopoverButtonItem;


@end


#elif defined IPHONE
@interface RootViewController : UITableViewController {
@private
	NSMutableArray *simuationControllers;

}

@end
#endif