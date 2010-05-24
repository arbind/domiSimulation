//
//  FileUtil.h
//  domiSimulation
//
//  Created by Arb on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FileUtil : NSObject {

}

+(NSString *) userHome:(NSString *)userName;
+(NSString *) pathToFilename:(NSString *) fileName;

+(BOOL) fileExists:(NSString *)filePath;
+(BOOL) directoryExists:(NSString *)dirPath;

+(BOOL) createDir:(NSString *)dirPath;
+(BOOL) createDir:(NSString *)dirPath attributes:(NSDictionary *)attributes error:(NSError **)error;
						
@end
