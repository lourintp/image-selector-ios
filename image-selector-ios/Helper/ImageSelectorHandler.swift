//
//  ImageSelectorHandler.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import UIKit

class ImageSelectorHandler {
    
    static let shared = ImageSelectorHandler()
    private(set) var currentSelectedImageUrl: String?
    private(set) var previousSeletedImageUrl: String?
    
    private init() {}
    
    func setCurrentSelectedImageUrl(_ imageUrl: String?) {
        setPreviousSelectedImageUrl(currentSelectedImageUrl)
        
        self.currentSelectedImageUrl = imageUrl
    }
    
    private func setPreviousSelectedImageUrl(_ imageUrl: String?) {
        self.previousSeletedImageUrl = imageUrl
    }
    
}
