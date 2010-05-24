//
//  domiPerson.h
//  domiSimulation
//
//  Created by Arb on 5/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "domiObject.h"

@interface domiPerson : domiObject {
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSMutableDictionary *preferences;

@property (nonatomic, retain) id privateRepo;
@property (nonatomic, retain) id anonymousRepo;

@property (nonatomic, retain) NSString *privateRepoKey;
@property (nonatomic, retain) NSString *anonymousRepoKey;

@end
