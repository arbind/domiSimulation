    //
//  RootViewController.m
//  domiSimulation
//
//  Created by Arb on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "domiSplashScreenViewController.h"
#import "domiSimulationViewController.h"

@implementation RootViewController

@synthesize popoverController, splitViewController, rootPopoverButtonItem;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	self.contentSizeForViewInPopover = CGSizeMake(310.0, self.tableView.rowHeight*10.0);
}

-(void) viewDidUnload {
	[super viewDidUnload];
	self.splitViewController = nil;
	self.rootPopoverButtonItem = nil;
}


#pragma mark -
#pragma mark Rotation support

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}


- (void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc {
	
	// Keep references to the popover controller and the popover button, and tell the detail view controller to show the button.
	barButtonItem.title = @"Simulations";
	self.popoverController = pc;
	self.rootPopoverButtonItem = barButtonItem;
	iPadSimulationViewController <SubstitutableDetailViewController> *detailViewController = [splitViewController.viewControllers objectAtIndex:1];
	[detailViewController showRootPopoverButtonItem:rootPopoverButtonItem];
}


- (void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
	
	// Nil out references to the popover controller and the popover button, and tell the detail view controller to hide the button.
	iPadSimulationViewController <SubstitutableDetailViewController> *detailViewController = [splitViewController.viewControllers objectAtIndex:1];
	[detailViewController invalidateRootPopoverButtonItem:rootPopoverButtonItem];
	self.popoverController = nil;
	self.rootPopoverButtonItem = nil;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
	return 10;
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"RootViewControllerCellIdentifier";
	
	// Dequeue or create a cell of the appropriate type.
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	// Set appropriate labels for the cells.
	switch (indexPath.row) {
		case 0:
			cell.textLabel.text = @"Spash Screen";
			break;
		case 1:
			cell.textLabel.text = @"User Repo";
			break;
		default:
			cell.textLabel.text = @"Spash Screen";
			break;
	}
	return cell;
}


#pragma mark -
#pragma mark Table view selection

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	iPadSimulationViewController *newDetailViewController;
	switch (indexPath.row) {
		case 0:
			newDetailViewController = [[domiSplashScreenViewController alloc] init];
			break;
		case 1:
			newDetailViewController = [[domiSimulationViewController alloc] init];
			break;
		default:
			newDetailViewController = [[domiSplashScreenViewController alloc] init];
			break;
	}
	
	// Update the split view controller's view controllers array.
	NSArray *viewControllers = [[NSArray alloc] initWithObjects:self.navigationController, newDetailViewController, nil];
	splitViewController.viewControllers = viewControllers;
	[viewControllers release];
	
	// Dismiss the popover if it's present.
	if (popoverController != nil) {
		[popoverController dismissPopoverAnimated:YES];
	}
	
	// Configure the new view controller's popover button (after the view has been displayed and its toolbar/navigation bar has been created).
	if (rootPopoverButtonItem != nil) {
		[newDetailViewController showRootPopoverButtonItem:self.rootPopoverButtonItem];
	}
	
	[newDetailViewController release];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[popoverController release];
	[rootPopoverButtonItem release];
	[super dealloc];
}

@end
