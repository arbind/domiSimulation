//
//  ToplogySimulationViewControllerIPHONE.m
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TopologySimulationViewControllerIPHONE.h"
#import "domiAppConfig.h"
#import "domiUser.h"

@implementation TopologySimulationViewControllerIPHONE
@synthesize usersTableView, devicesTableView, actionsTableView;
@synthesize userNameInput;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	userManager = [[UserListUIManager alloc] initWithTable:self.usersTableView];	
	deviceManager = [[[DeviceListUIManager alloc] initWithTable:self.devicesTableView] retain];
	actionManager = [[ActionListUIManager alloc] initWithTable:self.actionsTableView];

	userManager.multiSelectable = NO;
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

-(IBAction) addUser:(id)sender {
	[self.userNameInput resignFirstResponder];
	NSString *userName = userNameInput.text;
	domiAppConfig *appConfig = [domiAppConfig getInstance];

	domiUser* newUser = [appConfig createUser:userName];
	if (nil==newUser) {
		NSLog(@"Could Not Create New User for: %@", userName);

	}
	[userManager reloadData];
}

@end
