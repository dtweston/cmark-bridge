//
//  CmarkSwiftTest.swift
//  cmark-bridge
//
//  Created by Dave Weston on 4/2/15.
//  Copyright (c) 2015 Dave Weston. All rights reserved.
//

import Foundation
import XCTest
import cmark_bridge

class CmarkTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func stringForResource(name: String, withExtension ext: String?) -> NSString? {
        if let fileUrl = NSBundle(forClass: CmarkTest.self).URLForResource(name, withExtension: ext) {
            if let data = NSData(contentsOfURL: fileUrl) {
                return NSString(data: data, encoding: NSUTF8StringEncoding)
            }
        }
        
        return nil
    }
    
    func testExample() {
        if let expectedHtml = stringForResource("expected", withExtension: "html"),
            markdown = stringForResource("input", withExtension: "md") {
                
                let doc = cmark_parse_document(markdown.cStringUsingEncoding(NSUTF8StringEncoding), markdown.lengthOfBytesUsingEncoding(NSUTF8StringEncoding), 0)
                let html = cmark_render_html(doc, 0)
                if let htmlString = NSString(CString: html, encoding: NSUTF8StringEncoding) {
                    XCTAssertEqual(htmlString, expectedHtml, "HTML should match")
                    return
                }
        }
        
        XCTFail("Unable to match datax")
    }

}
