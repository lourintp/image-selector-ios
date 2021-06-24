//
//  Result.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import Foundation

public enum Result<Value> {
    case success(APIResponse)
    case failure(Error?)
}

typealias ResultCallback<Value> = (Result<Value>) -> Void
