//
//  ImageListParseTests.swift
//  image-selector-iosTests
//
//  Created by Thiago Lourin on 23/06/21.
//

import XCTest
@testable import image_selector_ios

class ImageListParseTests: XCTestCase {
    
    private var sut: APIClientProtocol?
    private var request: APIRequestMock?
    
    override func setUp() {
        sut = APIClientMock()
        request = APIRequestMock()
    }
    
    override func tearDown() {
        sut = nil
        request = nil
    }

    func testGettingImageListParsesWithoutError() {
        guard let request = request else { return }
        sut?.request(request, completion: { result in
            switch result {
            case .success(let response):
                let imageResponse = response as! ImageResponse
                XCTAssertEqual(imageResponse.imageList.count, 3)
                
            case .failure(_ ):
                break
            }
        })
    }
}
