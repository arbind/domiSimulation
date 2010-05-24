//
//  domiSimulation_IPADAppDelegate.h
//  domiSimulation-IPAD
//
//  Created by Arb on 5/23/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
	
#if defined IPAD
//@interface domiSimulation_IPADAppDelegate : NSObject <UIApplicationDelegate> {
@interface domiSimulationAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
		UISplitViewController *splitViewController;
	}
	
	@property (nonatomic, retain) IBOutlet UIWindow *window;
	@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;
	
	@end

#elif defined IPHONE
@interface domiSimulationAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
#endif