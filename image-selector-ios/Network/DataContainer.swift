//
//  DataContainer.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import Foundation

public struct DataContainer<Result: Decodable> : Decodable {
    public let result: Result
}
