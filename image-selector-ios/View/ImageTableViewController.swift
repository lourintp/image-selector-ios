//
//  ImageTableViewController.swift
//  image-selector-ios
//
//  Created by Thiago Lourin on 23/06/21.
//

import UIKit

class ImageTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var viewModel: ImageListViewModel
    var tableView = UITableView()
    
    init() {
        self.viewModel = ImageListViewModel()
        super.init(nibName: nil, bundle: nil)
        
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsMultipleSelection = false
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        viewModel.delegate = self
        viewModel.loadPaths(request: ImageRequest())
    }
    
    private func setupTableView() {
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView, constraints: true)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.cellForRow(tableView: tableView, identifier: "cell", indexPath.row)
        let imageUrl = viewModel.imageResponse?.imageList[indexPath.row] ?? ""        
        cell.setImageUrl(imageUrl)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heigthForRow()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.setCurrentSelectedImage(viewModel.imageResponse?.imageList[indexPath.row])
    }
    
}

extension ImageTableViewController: ImageListViewModelDelegate {
    func didFinishLoading() {
        tableView.reloadData()
    }
    
    func finishedWithError(_ message: String?) {
        
    }
}
