//
//  domiDevice.h
//  domiSimulation
//
//  Created by Arb on 5/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "domiObject.h"

@interface domiDevice : domiObject {

}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *ipAddress;

@end
