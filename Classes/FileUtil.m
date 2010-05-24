//
//  FileUtil.m
//  domiSimulation
//
//  Created by Arb on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FileUtil.h"

#define DIR_DOCUMENTS [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define DIR_DOMI [DIR_DOCUMENTS stringByAppendingPathComponent:@"domi"]

@implementation FileUtil

+(NSString *) domiHomeDir {
	BOOL dirOK = [FileUtil createDir:DIR_DOMI];
	if (YES==dirOK){
		return DIR_DOMI;
	}
	else {
		return nil;
	}	
}

+(NSString *) usersDir {
	NSString *domiDir = [FileUtil domiHomeDir];
	if (nil==domiDir) return nil;
	NSString *usersDir = [domiDir stringByAppendingPathComponent:@"users"];
	BOOL dirOK = [FileUtil createDir:usersDir];
	if (YES==dirOK){
		return usersDir;	
	}
	else {
		return nil;
	}
}

+(NSString *) userHomeDir:(NSString *)userName {
	//if (nil==userName || [NULL isEqual:userName] || 0==[userName length]) return nil;
	NSString *usersDir = [FileUtil usersDir];
	if (nil==usersDir) return nil;
	NSString *home = [usersDir stringByAppendingPathComponent:[userName lowercaseString]];
	BOOL dirOK = [FileUtil createDir:home];
	if (YES==dirOK){
		NSLog(@"created user dir: %@", home);
		return home;	
	}
	else {
		NSLog(@"ERROR creating user dir: %@", home);
		return nil;
	}
}

+ (NSArray *) directoryList:(NSString *) dirPath {
	BOOL dirOK = [FileUtil directoryExists:dirPath];
	if (NO==dirOK) return nil;
	
	NSFileManager *fileManager= [NSFileManager defaultManager]; 
	NSArray *dirContents = [fileManager directoryContentsAtPath:dirPath];
	return dirContents;
}

+(NSString *) pathToFilename:(NSString *)fileName {
	NSString *path = [DIR_DOCUMENTS stringByAppendingPathComponent:fileName];
	return path;
}

+(BOOL) fileExists:(NSString *)filePath {
	BOOL isDir=NO;
	BOOL exists = NO;
	NSFileManager *fileManager= [NSFileManager defaultManager]; 
	exists = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
	if (YES==exists && YES!=isDir) {
		return YES;
	}
	else {
		return NO;
	}
}

+(BOOL) directoryExists:(NSString *)dirPath {
	BOOL isDir=NO;
	BOOL exists = NO;
	NSFileManager *fileManager= [NSFileManager defaultManager]; 
	exists = [fileManager fileExistsAtPath:dirPath isDirectory:&isDir];
	if (YES==exists && YES==isDir) { //isDir is either YES or undefined
		return YES;
	}
	else {
		return NO;
  }
}

+(BOOL) createDir:(NSString *)dirPath {
	return [FileUtil createDir:dirPath attributes:nil error:nil];
}


+(BOOL) createDir:(NSString *)dirPath attributes:(NSDictionary *)attributes error:(NSError **)error{
	BOOL isDir=NO;
	BOOL fileExists = NO;
	BOOL createdDir = NO;
	NSFileManager *fileManager= [NSFileManager defaultManager]; 
	fileExists = [fileManager fileExistsAtPath:dirPath isDirectory:&isDir];
	if(YES==fileExists && YES==isDir){ //dir already exists
		NSLog(@"STATUS: create directory - dir already exists: %@", dirPath);
		return YES;
	}
	if (YES==fileExists) { //a file exists by that name - can not create a dir.
		NSLog(@"ERROR: create directory - file by same name already exists: %@", dirPath);
		return NO;
	}
	createdDir = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:NO attributes:attributes error:error];	
	if (YES == createdDir) {
		NSLog(@"Created directory: %@", dirPath);
		return YES;
	}
	else {
		NSLog(@"ERROR: create directory failed: %@", dirPath);
		NSLog(@"ERROR: %@", [(*error) description]);
		return NO;
	}
}

@end
