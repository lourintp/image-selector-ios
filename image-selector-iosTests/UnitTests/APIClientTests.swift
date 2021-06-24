//
//  APIClientTests.swift
//  image-selector-iosTests
//
//  Created by Thiago Lourin on 23/06/21.
//

import XCTest
@testable import image_selector_ios

class APIClientTests: XCTestCase {
        
    func testAPIClientRequestIsCalled() {
        let sut = APIClientMock()
        let expectation = XCTestExpectation(description: "finishing request")
        let anyRequest = AnyRequest()
        sut.request(anyRequest) { response in
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.5)
        XCTAssertTrue(sut.apiExecuted, "API wasn't executed as expected.")
    }
    
}

struct AnyRequest: APIRequest {
    typealias Response = AnyReponse
    
    var resourcePath: String { return "" }
}

struct AnyReponse: APIResponse {}
