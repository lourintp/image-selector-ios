//
//  ImageListViewModel.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import UIKit

protocol ImageListViewModelProtocol {
    func loadPaths<T: APIRequest>(request: T)
    func numberOfItems() -> Int
    func cellForRow(tableView: UITableView, identifier: String, _ row: Int) -> ImageTableViewCell
}

protocol ImageListViewModelDelegate: AnyObject {
    func didFinishLoading()
    func finishedWithError(_ message: String?)
}

class ImageListViewModel: ImageListViewModelProtocol {
    
    weak var delegate: ImageListViewModelDelegate?
    private(set) var imageResponse: ImageResponse?
    private var apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    func loadPaths<T: APIRequest>(request: T) {        
        apiClient.request(request) { result in
            switch result {
            case .success(let response):
                self.imageResponse = response as? ImageResponse
                self.delegate?.didFinishLoading()
                return
            case .failure(let error):
                self.delegate?.finishedWithError(error?.localizedDescription)
            }
        }
    }
    
    func numberOfItems() -> Int {
        if let response = imageResponse {
            return response.imageList.count
        }
        return 0
    }
    
    func cellForRow(tableView: UITableView, identifier: String, _ row: Int) -> ImageTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! ImageTableViewCell
        
        return cell
    }
    
    func heigthForRow() -> CGFloat {
        return 60.0
    }
    
    func setCurrentSelectedImage(_ imageUrl: String?) {
        ImageSelectorHandler.shared.setCurrentSelectedImageUrl(imageUrl)
    }
    
    func getCurrentSelectedImage() -> String? {
        return ImageSelectorHandler.shared.currentSelectedImageUrl
    }
            
    func getPreviousSelectedImage() -> String? {
        return ImageSelectorHandler.shared.previousSeletedImageUrl
    }
}
