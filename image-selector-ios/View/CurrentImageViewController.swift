//
//  CurrentImageViewController.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 24/06/21.
//

import UIKit

class CurrentImageViewController: UIViewController {

    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        imageView.imageFromServerURL(urlString: CurrentImageViewModel().imageUrl ?? "")
    }
    
    func setupImageView() {
        view.backgroundColor = .white
        view.addSubview(imageView, constraints: true)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

}
