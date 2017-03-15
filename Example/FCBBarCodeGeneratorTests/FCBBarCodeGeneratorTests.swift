//
//  FCBBarCodeGeneratorTests.swift
//  FCBBarCodeGeneratorTests
//
//  Created by Ezequiel França on 15/03/17.
//  Copyright © 2017 iDevzilla. All rights reserved.
//

import XCTest

class FCBBarCodeGeneratorTests: XCTestCase {
    
    func testCodeBarGenerator() {
        
        let text = "testCodeBarGenerator"
        let size = CGSize(width: 100.0, height: 100.0)
        let codeGenerator = FCBBarCodeGenerator()
        XCTAssertNotNil(codeGenerator)
        XCTAssertNotNil(size)
        XCTAssertNotNil(text)
        XCTAssertEqual(text, "testCodeBarGenerator")
        
        let qrcode = codeGenerator.barcodeWithCode(text, type: .qrcode, size: size)
         XCTAssertNotNil(qrcode)
        let pdf147 = codeGenerator.barcodeWithCode(text, type: .pdf417, size: size)
         XCTAssertNotNil(pdf147)
        let aztec = codeGenerator.barcodeWithCode(text, type: .aztec, size: size)
         XCTAssertNotNil(aztec)
        let code128 = codeGenerator.barcodeWithCode(text, type: .code128, size: size)
         XCTAssertNotNil(code128)
        
    }
    
}

