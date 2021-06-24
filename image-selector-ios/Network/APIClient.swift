//
//  APIClient.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import Foundation
import Alamofire

protocol APIClientProtocol {
    func request<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<DataContainer<T.Response>>)
}

public class APIClient: APIClientProtocol {
    
    static let shared = APIClient()
    
    private init() {}
    
    func request<T>(_ request: T, completion: @escaping ResultCallback<DataContainer<T.Response>>) where T : APIRequest {
        let endpoint: String!
               
        // MARK: TODO - Move url to plist or configuration file
        do {
            endpoint = try RequestCreator().get(for: request, url: "http://abihome-test.herokuapp.com").url?.absoluteString
        } catch let error {
            completion(.failure(error))
            return
        }
        
        AF.request(endpoint, method: .get, encoding: URLEncoding.httpBody, headers: [:]).validate().responseData { (responseData) in
            guard let data = responseData.data else {
                completion(.failure(nil))
                return
            }
            
            let stringData = String(data: data, encoding: .utf8)
            print("Response body: \(stringData ?? "")")
            
            do {
                let response = try JSONDecoder().decode(T.Response.self, from: data)
                completion(.success(response))
                return
            } catch let error {
                completion(.failure(error))
            }
        }
    }
    
}
