//
//  domiUser.h
//  domiSimulation
//
//  Created by Arb on 5/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "domiObject.h"
#import "domiRepo.h"

@interface domiUser : domiObject {
	domiRepo *privateRepo;
	//domiRepo *anonymousRepo;
}

@property (nonatomic, retain) NSString *userName;
@property (nonatomic, readonly) domiRepo *privateRepo;

+ (domiUser*) userWithUserName:(NSString *)userName;


@end
