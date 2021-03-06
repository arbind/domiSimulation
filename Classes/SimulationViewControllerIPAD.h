//
//  iPadSimulationViewController.h
//  domiSimulation
//
//  Created by Arb on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimulationViewController.h"

@protocol SubstitutableDetailViewController
- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem;
@end


@interface SimulationViewControllerIPAD : SimulationViewController <SubstitutableDetailViewController> {
	UIToolbar *toolbar;
	UINavigationBar *navigationBar;
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;

@end
