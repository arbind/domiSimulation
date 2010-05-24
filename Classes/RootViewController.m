//
//  RootViewController.m
//  domiSimulation
//
//  Created by Arb on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#if defined IPAD
#import "SplashScreenViewControllerIPAD.h"
#import "UserRepoSimulationViewControllerIPAD.h"
#import "TopologySimulationViewControllerIPAD.h"
#import "DietAppSimulationViewControllerIPAD.h"
#elif defined IPHONE
#import "SplashScreenViewControllerIPHONE.h"
#import "UserRepoSimulationViewControllerIPHONE.h"
#import "TopologySimulationViewControllerIPHONE.h"
#import "DietAppSimulationViewControllerIPHONE.h"
#endif


@implementation RootViewController

#if defined IPAD	
@synthesize splitViewController, popoverController, rootPopoverButtonItem;
#endif


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	simuationControllers = [[NSMutableArray alloc] init];
	
	[simuationControllers addObject:@"Splash Screen"];
	[simuationControllers addObject:@"User Repo Simulation"];
	[simuationControllers addObject:@"Topology Simulation"];
	[simuationControllers addObject:@"Diet App Simulation"];

#if defined IPAD	
	self.contentSizeForViewInPopover = CGSizeMake(310.0, self.tableView.rowHeight*[simuationControllers count]);
#endif
	
}

-(void) viewDidUnload {
	[super viewDidUnload];
#if defined IPAD	
	self.splitViewController = nil;
	self.rootPopoverButtonItem = nil;
#endif
}


#pragma mark -
#pragma mark Rotation support

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

#if defined IPAD	
- (void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc {
	
	// Keep references to the popover controller and the popover button, and tell the detail view controller to show the button.
	barButtonItem.title = @"Simulations";
	self.popoverController = pc;
	self.rootPopoverButtonItem = barButtonItem;
	SimulationViewControllerIPAD *detailViewController = [splitViewController.viewControllers objectAtIndex:1];
	[detailViewController showRootPopoverButtonItem:rootPopoverButtonItem];
}


- (void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
	
	// Nil out references to the popover controller and the popover button, and tell the detail view controller to hide the button.
	SimulationViewControllerIPAD *detailViewController = [splitViewController.viewControllers objectAtIndex:1];
	[detailViewController invalidateRootPopoverButtonItem:rootPopoverButtonItem];
	self.popoverController = nil;
	self.rootPopoverButtonItem = nil;
}
#endif

#pragma mark -
#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
	return [simuationControllers count];
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"RootViewControllerCellIdentifier";
	
	// Dequeue or create a cell of the appropriate type.
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	cell.textLabel.text = [simuationControllers objectAtIndex:indexPath.row];
	return cell;
}


#pragma mark -
#pragma mark Table view selection

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *controllerName=[simuationControllers objectAtIndex:indexPath.row];
	controllerName = [controllerName stringByReplacingOccurrencesOfString:@" " withString:@""];
	
#if defined IPAD
	controllerName = [controllerName stringByAppendingString:@"ViewControllerIPAD"];
#elif defined IPHONE
	controllerName = [controllerName stringByAppendingString:@"ViewControllerIPHONE"];
#endif
	
	NSLog(@"Creating: %@", controllerName);
	Class controllerClass = NSClassFromString(controllerName);
	SimulationViewController *newDetailViewController;
	
	
#if defined IPHONE 
	SimulationViewControllerIPHONE *iphoneDetailViewController = [[controllerClass alloc] init];
	newDetailViewController = (SimulationViewControllerIPHONE *) iphoneDetailViewController;
	[self.navigationController pushViewController:iphoneDetailViewController animated:YES];

#elif defined IPAD	
	SimulationViewControllerIPAD *ipadDetailViewController = [[controllerClass alloc] init];
	newDetailViewController = ipadDetailViewController;
	// Update the split view controller's view controllers array.
	NSArray *viewControllers = [[NSArray alloc] initWithObjects:self.navigationController, ipadDetailViewController, nil];
	splitViewController.viewControllers = viewControllers;
	[viewControllers release];
	
	// Dismiss the popover if it's present.
	if (popoverController != nil) {
		[popoverController dismissPopoverAnimated:YES];
	}
	
	// Configure the new view controller's popover button (after the view has been displayed and its toolbar/navigation bar has been created).
	if (rootPopoverButtonItem != nil) {
		[ipadDetailViewController showRootPopoverButtonItem:self.rootPopoverButtonItem];
	}
	
#endif
	
	[newDetailViewController release];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[simuationControllers release];

#if defined IPAD
	[popoverController release];
	[rootPopoverButtonItem release];
#endif
	[super dealloc];
}

@end
