//
//  APIRequestMock.swift
//  image-selector-iosTests
//
//  Created by Thiago Lourin on 23/06/21.
//

import Foundation
@testable import image_selector_ios

struct APIRequestMock: APIRequest {
    var resourcePath: String {
        return "ImageList"
    }
    
    typealias Response = ImageResponse
}

