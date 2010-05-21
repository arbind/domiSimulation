    //
//  iPadSimulationViewController.m
//  domiSimulation
//
//  Created by Arb on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "iPadSimulationViewController.h"


@implementation iPadSimulationViewController
@synthesize toolbar, navigationBar;




#pragma mark -
#pragma mark View lifecycle

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

NSString * const domiViewControllerClassSuffix = @"simulationviewcontroller";

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	NSString *className = NSStringFromClass([self class]);
	if ([[className lowercaseString] hasSuffix:domiViewControllerClassSuffix]) {
		className = [className substringToIndex:[className length] - [domiViewControllerClassSuffix length]];
	}
	self.title = className;
	self.splitViewController.title = className;
}


- (void)viewDidUnload {
	[super viewDidUnload];
	
	self.toolbar = nil;
	self.navigationBar = nil;
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark -
#pragma mark Managing the popover

- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
	if (nil!=toolbar) { // Add the popover button to the toolbar.
		NSMutableArray *itemsArray = [toolbar.items mutableCopy];
		[itemsArray insertObject:barButtonItem atIndex:0];
		[toolbar setItems:itemsArray animated:NO];
		[itemsArray release];
	}
	else { // Add the popover button to the left navigation item.
    [navigationBar.topItem setLeftBarButtonItem:barButtonItem animated:NO];
	}
}


- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {	
	if (nil!=toolbar) { // Remove the popover button from the toolbar.
		NSMutableArray *itemsArray = [toolbar.items mutableCopy];
		[itemsArray removeObject:barButtonItem];
		[toolbar setItems:itemsArray animated:NO];
		[itemsArray release];
	}
	else { // Remove the popover button.
    [navigationBar.topItem setLeftBarButtonItem:nil animated:NO];
	}
}


#pragma mark -
#pragma mark Rotation support

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}


- (void)dealloc {
		[navigationBar release];
		[toolbar release];
		[super dealloc];
}


@end
