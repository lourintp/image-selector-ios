//
//  ImageSelectorViewController.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import UIKit

enum TabTitles: String, CustomStringConvertible {
    case ImageList = "Image List"
    case CurrentImage = "Current"
    case PreviousImage = "Previous"
    
    var description: String {
        return self.rawValue
    }
}

class ImageSelectorViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageTableView = ImageTableViewController()
        let currentImage = CurrentImageViewController()
        let previousImage = PreviousImageViewController()
        
        imageTableView.title = TabTitles.ImageList.rawValue
        currentImage.title = TabTitles.CurrentImage.rawValue
        previousImage.title = TabTitles.PreviousImage.rawValue
        
        viewControllers = [imageTableView, currentImage, previousImage]
    }
}
