//
//  domiSimulationAppDelegate.h
//  domiSimulation
//
//  Created by Arb on 5/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class domiSimulationViewController;

@interface domiSimulationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    domiSimulationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet domiSimulationViewController *viewController;

@end

