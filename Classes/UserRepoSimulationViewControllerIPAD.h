//
//  domiSimulationViewController.h
//  domiSimulation
//
//  Created by Arb on 5/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimulationViewControllerIPAD.h"
#import "domiRepo.h"

@interface UserRepoSimulationViewControllerIPAD : SimulationViewControllerIPAD {

	IBOutlet UITextField *user1;
	IBOutlet UITextField *user2;
	
	IBOutlet UITextField *data1;
	IBOutlet UITextField *data2;

	IBOutlet UITextView *repoView1;
	IBOutlet UITextView *repoView2;
	
	domiRepo *repo1;
	domiRepo *repo2;	
	
}

@property(nonatomic, retain) IBOutlet UITextField *user1;
@property(nonatomic, retain) IBOutlet UITextField *user2;

@property(nonatomic, retain) IBOutlet UITextField *data1;
@property(nonatomic, retain) IBOutlet UITextField *data2;

@property(nonatomic, retain) IBOutlet UITextView *repoView1;
@property(nonatomic, retain) IBOutlet UITextView *repoView2;

@property(nonatomic, retain) domiRepo *repo1;
@property(nonatomic, retain) domiRepo *repo2;	

-(IBAction) saveUser1:(id) sender;
-(IBAction) saveUser2:(id) sender;

-(IBAction) JSONTest:(id) sender;

@end

