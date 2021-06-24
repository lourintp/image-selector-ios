//
//  ImageResponse.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import Foundation

struct ImageResponse: APIResponse {
    var imageList: [String] = []
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        if let _ = container.count {
            while !container.isAtEnd {
                if let image = try? container.decode(String.self) {
                    imageList.append(image)
                }
            }
        }
    }
}
