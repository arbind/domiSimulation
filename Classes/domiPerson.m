//
//  domiPerson.m
//  domiSimulation
//
//  Created by Arb on 5/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "domiPerson.h"


@implementation domiPerson

-(NSString*) name { return (NSString*)[self dataForKey:kName];  }
-(void) setName:(NSString *)s {[self setData:s forKey:kName];  }

-(NSMutableDictionary *) preferences { return (NSMutableDictionary *)[self dataForKey:kPreferences];  }
-(void) setPreferences:(NSMutableDictionary *)p {[self setData:p forKey:kPreferences];  }

-(id) privateRepo {return [self dataForKey:kPrivateRepo];  }
-(void) setPrivateRepo:(id)d { [self setData:d forKey:kPrivateRepo];  }
-(id) anonymousRepo {return [self dataForKey:kAnonymousRepo];  }
-(void) setAnonymousRepo:(id)d { [self setData:d forKey:kAnonymousRepo];  }

-(NSString *) privateRepoKey {return (NSString *)[self dataForKey:kPrivateRepo];  }
-(void) setPrivateRepoKey:(id)d { [self setData:d forKey:kPrivateRepo];  }
-(NSString *) anonymousRepoKey { return (NSString *)[self dataForKey:kAnonymousRepo];  }
-(void) setAnonymousRepoKey:(id)d { [self setData:d forKey:kAnonymousRepo];  }

@end
