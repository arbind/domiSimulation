#import "domiAppConfig.h"
#import "FileUtil.h"

static domiAppConfig* instance;

@implementation domiAppConfig

// Initialization
- (id) init {
  deviceName = @"unknown";
  return self;
}


// Cleanup
- (void)dealloc {
  [super dealloc];
}


// Automatically initialize if called for the first time
+ (domiAppConfig*) getInstance {
  @synchronized([domiAppConfig class]) {
    if ( instance == nil ) {
      instance = [[domiAppConfig alloc] init];
    }
  }
  
  return instance;
}

-(NSString*) deviceName {
	return deviceName;
}

-(BOOL) userNameIsValid:(NSString *) userName {
	if (nil==userName) return NO;
	//+++ todo, check if first char is a number
	NSString *badCharacters = @" !+-=*^&%$#@!~`[]{}'\";:/?.>,<\t\r\n"; //+++ todo expand as needed
	NSCharacterSet *badCharacterSet = [NSCharacterSet characterSetWithCharactersInString:badCharacters]; 
	NSRange r=[userName rangeOfCharacterFromSet:badCharacterSet];
	if (0==r.length) return YES;
	return NO;
}


-(domiUser*) createUser:(NSString *)userName {
	if (NO==[self userNameIsValid:userName]) return nil;	
	domiUser *user = [domiUser userWithUserName:userName];
	return user;
}

- (NSArray*) localUsers {
	NSString *usersDir = [FileUtil usersDir];
	if (nil==usersDir) return nil;
	NSArray *userNames = [FileUtil directoryList:usersDir];
	
	NSMutableArray *users = [[NSMutableArray alloc] init];
	domiUser *user;
	for (NSString *userName in userNames) {
		user = [[domiUser alloc] init];
		user.userName = userName;
		[users addObject:user];
	}
	return users;
}

@end
