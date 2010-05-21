//
//  ReverseLineReader.h
//  ReadFile
//
//  Created by Arbind Thakur on 2010.05.19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileReader : NSObject {
	NSString *filename;
	FILE *stream;
	long position;
	long fileSize;	
	
	long maxLineLengthExpected;
}

@property (nonatomic, readonly) NSString *filename;
@property (nonatomic, readonly) long fileSize;
@property (nonatomic)  long maxLineLengthExpected;

+(FileReader *) fileReaderWithFile:(NSString*) filePath;
-(id) initWithFile:(NSString *)filePath;
-(id) initWithFile:(NSString *)filePath usingEncoding:(NSStringEncoding)encoding;

-(void)seekToEndOfFile;
-(void)seekToStartOfFile;

-(NSString *) readNextLine;
-(NSString *) readPreviousLine;

@end
