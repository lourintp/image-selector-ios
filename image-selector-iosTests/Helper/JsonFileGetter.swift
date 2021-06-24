//
//  JsonFileGetter.swift
//  image-selector-iosTests
//
//  Created by Thiago Lourin on 23/06/21.
//

import Foundation

public class JsonFileGetter {
    
    public func toData(jsonFileName: String) -> Data? {
        guard let url = Bundle(for: type(of: self)).url(forResource: jsonFileName, withExtension: "json") else {
            fatalError("Missing file: \(jsonFileName).json")
        }
        
        do {
            return try Data(contentsOf: url)
        } catch let error {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
}
