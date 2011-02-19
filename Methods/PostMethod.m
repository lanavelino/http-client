/**
 *  @file PostMethod.m
 *  HttpClient
 *
 *  Copyright (c) 2010 Scott Slaugh, Brigham Young University
 *   
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *   
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 *
 */

#import "PostMethod.h"


@implementation PostMethod

/**
 * Execute the POST method
 * - methodURL: The URL to use for executing the POST method
 */
- (HttpResponse*)executeSynchronouslyAtURL:(NSURL*)methodURL {
	return [super executeMethodSynchronously:methodURL methodType:@"POST" dataInBody:YES contentType:contentType ? contentType : @"application/x-www-form-urlencoded"];
}

- (void)executeAsynchronouslyAtURL:(NSURL*)methodURL withDelegate:(id<HttpClientDelegate,NSObject>)delegate {
	[super executeMethodAsynchronously:methodURL methodType:@"POST" dataInBody:YES contentType:contentType ? contentType :@"application/x-www-form-urlencoded" withDelegate:delegate];
}

- (void) setBody:(NSData*) inBody contentType:(NSString*) inContentType {
	body = [inBody retain];
	contentType = [inContentType retain];
}

- (void) setStringBody:(NSString*) inBody contentType:(NSString*) inContentType {
	body = [[inBody dataUsingEncoding:NSUTF8StringEncoding] retain];
	contentType = [inContentType retain];
}

- (void) dealloc {
	[contentType release];
	
	[super dealloc];
}

@end
