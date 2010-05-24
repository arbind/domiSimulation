//
//  DomiRepo.h
//  ReadFile
//
//  Created by Arbind Thakur on 2010.05.19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface domiRepo : NSObject {
	NSString *unique;	
	NSString *repoPath;
	
	NSString *repoDescriptorFilePath;
	NSString *repoHeadFilePath;
	NSString *repoID;
}

@property (nonatomic, readonly) NSString *unique;
@property (nonatomic, readonly) NSString *repoHeadFilePath;

+(domiRepo *) repoForUser:(NSString *)userName;

-(id) initForUser:(NSString *)userName;

-(void)save:(NSString *) data;
-(void)merge:(domiRepo*)otherRepo;

-(void)mergeTestForFile1:(NSString *)oneFile file2:(NSString *)twoFile outFile:(NSString *)outFile;

@end
