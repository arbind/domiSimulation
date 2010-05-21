//
//  domiSimulationViewController.h
//  domiSimulation
//
//  Created by Arb on 5/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iPadSimulationViewController.h"
#import "DomiRepo.h"

@interface domiSimulationViewController : iPadSimulationViewController {

	IBOutlet UITextField *user1;
	IBOutlet UITextField *user2;
	
	IBOutlet UITextField *data1;
	IBOutlet UITextField *data2;

	IBOutlet UITextView *repoView1;
	IBOutlet UITextView *repoView2;
	
	DomiRepo *repo1;
	DomiRepo *repo2;	
	
}

@property(nonatomic, retain) IBOutlet UITextField *user1;
@property(nonatomic, retain) IBOutlet UITextField *user2;

@property(nonatomic, retain) IBOutlet UITextField *data1;
@property(nonatomic, retain) IBOutlet UITextField *data2;

@property(nonatomic, retain) IBOutlet UITextView *repoView1;
@property(nonatomic, retain) IBOutlet UITextView *repoView2;

@property(nonatomic, retain) DomiRepo *repo1;
@property(nonatomic, retain) DomiRepo *repo2;	

-(IBAction) saveUser1:(id) sender;
-(IBAction) saveUser2:(id) sender;

@end

