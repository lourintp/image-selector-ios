//
//  APIRequest.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import Foundation

public protocol APIRequest: Codable {
    
    var resourcePath: String { get }
    
    associatedtype Response: APIResponse
}
