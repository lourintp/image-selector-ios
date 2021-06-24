//
//  APIClientMock.swift
//  image-selector-iosTests
//
//  Created by Thiago Lourin on 23/06/21.
//

import Foundation
@testable import image_selector_ios

struct MockError: Error {
    var localizedDescription: String
}

internal class APIClientMock: APIClientProtocol {
    
    var apiExecuted = false
    var hasError = false
    
    func request<T>(_ request: T, completion: @escaping ResultCallback<DataContainer<T.Response>>) where T : APIRequest {
        apiExecuted = true
        
        if hasError {
            completion(.failure(MockError(localizedDescription: "Mocked error")))
        }
        
        let list = JsonFileGetter().toData(jsonFileName: request.resourcePath)
        let decoder = JSONDecoder()
        
        if let data = list {
            do {
                let response = try decoder.decode(T.Response.self, from: data)
                completion(.success(response))
            } catch let error {
                completion(.failure(error))
            }
        }
    }
    
}
