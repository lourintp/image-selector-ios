//
//  UITableViewSpy.swift
//  image-selector-iosTests
//
//  Created by Thiago Lourin on 23/06/21.
//

import UIKit
@testable import image_selector_ios

class UITableViewSpy: UITableViewController {
        
    init() {
        super.init(nibName: nil, bundle: nil)
        
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
}
