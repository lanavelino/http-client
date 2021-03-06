/**
 * @file StringPart.m
 * HttpClient
 *
 *  Copyright (c) 2010 Scott Slaugh, Brigham Young University
 *  Copyright (c) 2012 Lolay, Inc.
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

#import "StringPart.h"
#import "Constants.h"


@implementation StringPart

- (id) initWithParameter:(NSString*)valueData withName:(NSString*)valueName {
	self = [super init];
	
	if (self != nil) {
		name = valueName;
		value = valueData;
}
	
	return self;
}

+(StringPart*) stringPartWithParameter:(NSString*)valueData withName:(NSString*)valueName {
	return [[StringPart alloc] initWithParameter:valueData withName:valueName];
}

- (void)appendData:(NSMutableData*)outputData {	
	[outputData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n", name] dataUsingEncoding:encoding]];
	[outputData appendData:[[NSString stringWithString:@"Content-Type: text/plain; charset=UTF-8\r\n"] dataUsingEncoding:encoding]];
	[outputData appendData:[[NSString stringWithString:@"Content-Transfer-Encoding: binary\r\n"] dataUsingEncoding:encoding]];
	[outputData appendData:[[NSString stringWithFormat:@"Content-ID: <%@>\r\n",name] dataUsingEncoding:encoding]];
	[outputData appendData:[[NSString stringWithFormat:@"\r\n%@\r\n",value] dataUsingEncoding:encoding]];
}

@end
