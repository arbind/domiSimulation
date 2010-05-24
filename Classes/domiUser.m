//
//  domiUser.m
//  domiSimulation
//
//  Created by Arb on 5/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "domiUser.h"


@implementation domiUser

-(NSString*) name { return (NSString*)[self dataForKey:kName];  }
-(void) setName:(NSString *)s {[self setData:s forKey:kName];  }

@end
