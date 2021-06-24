//
//  ImageTableViewCell.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
            
    var cellViewModel: ImageCellViewModel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellViewModel = ImageCellViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()                
    }
            
    func setImageUrl(_ urlString: String) {
        guard let viewModel = cellViewModel else { return }
        viewModel.imageUrl = urlString
        
        if let viewModel = cellViewModel {
            imageView?.imageFromServerURL(urlString: viewModel.imageUrl)
        }
    }

}
