//
//  ImageRequest.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import Foundation
import Alamofire

struct ImageRequest: APIRequest {
    
    var resourcePath: String { return "/test/images"}    
    
    typealias Response = ImageResponse
    
}
