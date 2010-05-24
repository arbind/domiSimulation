//
//  domiSimulationViewController.m
//  domiSimulation
//
//  Created by Arb on 5/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "UserRepoSimulationViewControllerIPAD.h"
#import "domiPerson.h"

@implementation UserRepoSimulationViewControllerIPAD
@synthesize user1, user2, data1, data2, repoView1, repoView2, repo1, repo2;	

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
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


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

-(void) initRepo1 {
	if (nil!=repo1) return;
	self.repo1 =	[[domiRepo alloc] initForUser:self.user1.text];
}

-(void) initRepo2 {
	if (nil!=repo2) return;
	self.repo2 =	[[domiRepo alloc] initForUser:self.user2.text];
}


-(IBAction) saveUser1:(id) sender {
	[self initRepo1];
	[self.repo1 save:self.data1.text];
	NSString *p = repo1.repoHeadFilePath;
	NSString *contents = [[NSString alloc] initWithContentsOfFile:p encoding:NSASCIIStringEncoding error:nil];
	self.repoView1.text = contents;
}

-(IBAction) saveUser2:(id) sender {
	[self initRepo2];
	[self.repo2 save:self.data2.text];
	NSString *p = repo2.repoHeadFilePath;
	NSString *contents = [[NSString alloc] initWithContentsOfFile:p encoding:NSASCIIStringEncoding error:nil];
	self.repoView2.text = contents;
}




-(IBAction) JSONTest:(id) sender {
	
	domiPerson *p1 = [[domiPerson alloc] init];
	p1.domiKey = @"This is my P1 Persons key";
	p1.name = @"Jim";
	NSMutableDictionary *p1Prefs = [[NSMutableDictionary alloc] init];
	[p1Prefs setValue:@"blue" forKey:@"favorite-color"];
	[p1Prefs setValue:@"8" forKey:@"favorite-number"];
	p1.preferences = p1Prefs;
	[p1 setValue:@"RandomValue" forKey:@"randomKey"];

	NSLog(@"%@: %@",p1.name, [p1 JSONRepresentation]);
	
	NSString *p1JSON = [p1 JSONRepresentation];
	
	domiPerson *p2 = (domiPerson *)[domiObject domiObjectFromJSONRepresentation:p1JSON];	

	NSLog(@"%@: %@",p2.name, [p2 JSONRepresentation]);
}

@end
