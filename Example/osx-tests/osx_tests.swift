//
//  osx_tests.swift
//  osx-tests
//
//  Created by Dave Weston on 5/16/15.
//  Copyright (c) 2015 Dave Weston. All rights reserved.
//

import Cocoa
import XCTest
import cmark_bridge

class osx_tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func stringForResource(named: String, withExtension ext: String) -> String? {
        if let fileUrl = NSBundle(forClass: osx_tests.self).URLForResource(named, withExtension: ext) {
            if let data = NSData(contentsOfURL: fileUrl) {
                return NSString(data: data, encoding: NSUTF8StringEncoding) as String?
            }
        }
        
        return nil
    }
    
    func testExample() {
        if let expectedHtml = stringForResource("expected", withExtension:"html"),
            let markdown = stringForResource("input", withExtension:"md") {
                let doc = cmark_parse_document(markdown.cStringUsingEncoding(NSUTF8StringEncoding)!, markdown.lengthOfBytesUsingEncoding(NSUTF8StringEncoding), 0)
                let html = cmark_render_html(doc, 0)
                if let actualHtml = NSString(CString:html, encoding:NSUTF8StringEncoding) as String? {
                    XCTAssertEqual(expectedHtml, actualHtml, "HTML should match")
                    return
                }
        }
        
        XCTFail("Test did not run")
    }
    
}
