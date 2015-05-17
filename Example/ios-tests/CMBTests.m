//
//  CMBTests.m
//  cmark-bridge
//
//  Created by Dave Weston on 4/3/15.
//  Copyright (c) 2015 Dave Weston. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@import cmark_bridge;

@interface CMBTests : XCTestCase

@end

@implementation CMBTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (NSString *)stringForResource:(NSString *)name withExtension:(NSString *)ext
{
    NSURL *fileUrl = [[NSBundle bundleForClass:[CMBTests class]] URLForResource:name withExtension:ext];
    if (fileUrl) {
        NSData *data = [NSData dataWithContentsOfURL:fileUrl];
        if (data) {
            return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    
    return nil;
}

- (void)testExample {
    NSString *expectedHtml = [self stringForResource:@"expected" withExtension:@"html"];
    NSString *markdown = [self stringForResource:@"input" withExtension:@"md"];
    
    if (expectedHtml && markdown) {
        cmark_node *doc = cmark_parse_document([markdown cStringUsingEncoding:NSUTF8StringEncoding], [markdown lengthOfBytesUsingEncoding:NSUTF8StringEncoding], 0);
        char *html = cmark_render_html(doc, 0);
        NSString *actualHtml = [NSString stringWithCString:html encoding:NSUTF8StringEncoding];
        
        XCTAssertEqualObjects(expectedHtml, actualHtml, @"HTML should match");
        return;
    }
    
    XCTFail(@"Test did not run");
}

@end
