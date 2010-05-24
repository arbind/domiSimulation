//
//  domiPerson.m
//  domiSimulation
//
//  Created by Arb on 5/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "domiPerson.h"


@implementation domiPerson

-(NSString*) name { return (NSString*)[self valueForKey:kName];  }
-(void) setName:(NSString *)s {[self setValue:s forKey:kName];  }

-(NSMutableDictionary *) preferences { return (NSMutableDictionary *)[self valueForKey:kPreferences];  }
-(void) setPreferences:(NSMutableDictionary *)p {[self setValue:p forKey:kPreferences];  }

-(id) privateRepo {return [self valueForKey:kPrivateRepo];  }
-(void) setPrivateRepo:(id)d { [self setValue:d forKey:kPrivateRepo];  }
-(id) anonymousRepo {return [self valueForKey:kAnonymousRepo];  }
-(void) setAnonymousRepo:(id)d { [self setValue:d forKey:kAnonymousRepo];  }

-(NSString *) privateRepoKey {return (NSString *)[self valueForKey:kPrivateRepo];  }
-(void) setPrivateRepoKey:(id)d { [self setValue:d forKey:kPrivateRepo];  }
-(NSString *) anonymousRepoKey { return (NSString *)[self valueForKey:kAnonymousRepo];  }
-(void) setAnonymousRepoKey:(id)d { [self setValue:d forKey:kAnonymousRepo];  }

@end
