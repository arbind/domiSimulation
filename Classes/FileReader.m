//
//  ReverseLineReader.m
//  ReadFile
//
//  Created by Arbind Thakur on 2010.05.19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FileReader.h"


@implementation FileReader
@synthesize filename, fileSize, maxLineLengthExpected;

+(FileReader *) fileReaderWithFile:(NSString*) filePath {
	return  [[FileReader alloc] initWithFile:filePath];
}

-(id) initWithFile:(NSString *)filePath {
	return [self initWithFile:filePath usingEncoding:NSASCIIStringEncoding];
}

-(id) initWithFile:(NSString *)filePath usingEncoding:(NSStringEncoding)encoding {
	self = [super init];
	if (!self) return nil;
	maxLineLengthExpected = 8192;
	filename = [filePath copy];
	NSFileManager *man = [[NSFileManager alloc] init];
	NSDictionary *attrs = [man attributesOfItemAtPath:filename error: NULL];
	if (nil!=attrs && 0 < [attrs count]) {
		fileSize = [attrs fileSize];
		position = fileSize;
		stream = fopen([filename cStringUsingEncoding:encoding], "r");
	}
	else {
		fileSize = 0;
		position = -1;
		stream = NULL;
	}
	return self;
}


-(void)seekToEndOfFile {
	position = fileSize;
	if (0==position) position = -1;
}

-(void)seekToStartOfFile {
	position = 0;
	fseek (stream , 0, SEEK_SET );
}


-(NSString *) tailPreviousLine {
	if (0>position) return nil;
	
	NSString *line;
	char buf[maxLineLengthExpected];
	long idx = 0;
	char ch=' ';
	fseek (stream , --position, SEEK_SET );
	ch = getc( stream );
	printf( "%c", ch );
	while( '\n' ==ch && 0<=position) {
		fseek ( stream , --position, SEEK_SET );
		ch = getc( stream );
		printf( "%c", ch );
	}
	while( ch != '\n' && 0<=position) {
		if ('\r'!=ch) {
			buf[idx++] = ch;
		}
		fseek ( stream , --position , SEEK_SET );
		ch = getc( stream);
		printf( "%c", ch );
	}
	buf[idx]= '\0';
	
	//reverse the buf:
	char straight[idx];
	for (int i =0; i<idx; i++) straight[i] = buf[idx-i-1];
	
	NSData *data = [NSData dataWithBytes:straight length:idx];
	line = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
	return line;
}


-(NSString *) readNextLine {
	if (feof(stream)) return nil;
	
	NSString *line;
	char buf[maxLineLengthExpected];
	long idx = 0;
	char ch=' ';
	ch = getc( stream );
	position++;
	while( '\n' ==ch && EOF != ch) {
		ch = getc( stream );
		position++;
	}
	while( ch != '\n' && EOF != ch) {
		if ('\r'!=ch) {
			buf[idx++] = ch;
		}
		ch = getc( stream);
		position++;
	}
	buf[idx]= '\0';
	
	NSData *data = [NSData dataWithBytes:buf length:idx];
	line = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
	return line;
}

- (void)dealloc {
	[super dealloc];
	fclose(stream);
}

@end
