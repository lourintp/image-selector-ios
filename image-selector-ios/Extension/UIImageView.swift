//
//  UIImageView.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import UIKit

extension UIImageView {
    
    public func imageFromServerURL(urlString: String, placeHolder: UIImage = UIImage(named: "Placeholder")!) {
        if self.image == nil{
            self.image = placeHolder
        }

        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
                self.layoutSubviews()
            })
        }).resume()
    }
    
}
