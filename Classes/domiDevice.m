//
//  domiDevice.m
//  domiSimulation
//
//  Created by Arb on 5/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "domiDevice.h"

@implementation domiDevice

-(NSString*) name { return (NSString*)[self dataForKey:kName];  }
-(void) setName:(NSString *)s {[self setData:s forKey:kName];  }

-(NSString*) ipAddress { return (NSString*)[self dataForKey:kIPAddress];  }
-(void) setIpAddress:(NSString *)s {[self setData:s forKey:kIPAddress];  }

@end
