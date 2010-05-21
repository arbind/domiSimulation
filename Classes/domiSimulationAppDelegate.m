//
//  domiSimulationAppDelegate.m
//  domiSimulation
//
//  Created by Arb on 5/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "domiSimulationAppDelegate.h"
#import "domiSimulationViewController.h"

@implementation domiSimulationAppDelegate

@synthesize window, splitViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after app launch    
    [window addSubview:splitViewController.view];
    [window makeKeyAndVisible];
		return YES;
}


- (void)dealloc {
    [splitViewController release];
    [window release];
    [super dealloc];
}


@end
