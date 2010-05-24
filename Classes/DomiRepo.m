//
//  DomiRepo.m
//  ReadFile
//
//  Created by Arbind Thakur on 2010.05.19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "domiRepo.h"

#import "FileUtil.h"
#import "FileReader.h"

NSString * const kID = @"id";
NSString * const kHEAD = @"head";

@implementation domiRepo
@synthesize unique, repoHeadFilePath;


#pragma mark util

-(void) materializeRepoID {
	repoID = @"1";
}


-(void) materializeEmptyRepo { //+++ ToDo write as json
	NSMutableDictionary *repoMap = [[NSMutableDictionary alloc] init];	
	[self materializeRepoID];
	[repoMap setValue:repoID forKey:kID];
	[repoMap setValue:repoHeadFilePath forKey:kHEAD];
	
	//+++ todo create secure and robust way to write files 
  // so that file doesn't get corrupted if system crashes durring write
	// without useing atomically - which writes data in temp location - not secure
	[repoMap writeToFile:repoDescriptorFilePath atomically:NO];
	 
}

-(void) loadDescriptorFile {  //+++ ToDo load from json
	NSDictionary *repoMap = [NSDictionary dictionaryWithContentsOfFile:repoDescriptorFilePath];
	repoID = [repoMap valueForKey:kID];
	repoHeadFilePath = [repoMap valueForKey:kHEAD];
}



+(domiRepo *) repoForUser:(NSString *)userName {
	domiRepo *repo = [[domiRepo alloc] initForUser:userName];
	return repo;
}

-(id) initForUser:(NSString *)userName {
	self = [super init];
	if (!self) return nil;
	NSString *userHomeDir = [FileUtil userHomeDir:userName];
	repoPath = [[userHomeDir stringByAppendingPathComponent:@"repo"] retain];
	BOOL repoExists = [FileUtil createDir:repoPath];
	if (NO==repoExists) {
		NSLog(@"ERROR could not create repo: %@", repoPath);
		return nil;
	}
	repoDescriptorFilePath = [[repoPath stringByAppendingPathComponent:@"domi.repo"] retain];
	repoHeadFilePath =  [[repoPath stringByAppendingPathComponent:@"head.txt"] retain];
	BOOL descriptorFileExists = [FileUtil fileExists:repoDescriptorFilePath];
	if (YES!=descriptorFileExists) {
		[self materializeEmptyRepo];
	}
	
	[self loadDescriptorFile];
	return self;
}

-(void)save:(NSString *) data {	
	NSError *err;
	NSString *repo = [NSString stringWithContentsOfFile:repoHeadFilePath encoding:NSASCIIStringEncoding error:&err];
	if (nil==repo)  repo = @"";
	NSString *newData = [NSString stringWithFormat:@"%@\n",data];
	repo = [repo stringByAppendingString:newData];
	BOOL ok = [repo writeToFile:repoHeadFilePath atomically:NO encoding:NSASCIIStringEncoding error:&err]; // +++ use utility for secure robust save
	if (NO==ok) {
		NSLog(@"2ERROR saving data: %@", data);
		NSLog(@"ERROR: %@", [err description]);
	}
	else {
		NSLog(@"saved data to: %@", repoHeadFilePath);
	}

}

-(void)merge:(domiRepo*)otherRepo {
}

-(void)mergeTestForFile1:(NSString *)oneFile file2:(NSString *)twoFile outFile:(NSString *)outFile {
	FileReader *reader1 = [FileReader fileReaderWithFile:oneFile];
	FileReader *reader2 = [FileReader fileReaderWithFile:twoFile];
	[reader1 seekToEndOfFile];
	[reader2 seekToEndOfFile];
	NSString *line1 = @"-";
	NSString *line2 = @"-";
	
	NSMutableArray *allLines = [[NSMutableArray alloc] init];
	while (!(nil==line1 && nil==line2)) {
		line1 = [reader1 readPreviousLine];
		line2 = [reader2 readPreviousLine];
		if (nil!=line1) [allLines insertObject:line1 atIndex:0]; 
		if (nil!=line2) [allLines insertObject:line2 atIndex:0]; 
	}
	
	NSString *mergedFiles = [[NSString alloc] init];;
	for (NSString *s in allLines) {
		mergedFiles = [NSString stringWithFormat:@"%@\n%@",mergedFiles,s];
	}
	[mergedFiles writeToFile:outFile  atomically:NO encoding:NSASCIIStringEncoding error:nil];
	NSLog(@"Merged Files: \n%@", mergedFiles);
}

-(void) dealloc {
	[super dealloc];
	[repoPath release];
	[repoDescriptorFilePath release];
	[repoHeadFilePath release];
}

@end
