//
//  ImageListViewModelTests.swift
//  image-selector-iosTests
//
//  Created by Thiago Lourin on 23/06/21.
//

import XCTest
@testable import image_selector_ios

class ImageListViewModelTests: XCTestCase {
        
    var sut: ImageListViewModel?
    
    override func setUp() {
        sut = ImageListViewModel(apiClient: APIClientMock())
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testNumberOfItemsReturnsCorrectNumberOfItems() {
        sut?.loadPaths(request: APIRequestMock())
        XCTAssertEqual(sut?.numberOfItems(), 3, "Number of items should be 3")
    }
    
    func testCellForRowReturnsImageTableViewCell() {
        sut?.loadPaths(request: APIRequestMock())
        
        let tableViewSpy = UITableViewSpy()
        let cell = sut?.cellForRow(tableView: tableViewSpy.tableView, identifier: "cell", 0)
        
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell is ImageTableViewCell, "cell should be from type ImageTableViewCell")
    }
    
    func testCellForRowReturnsImageTableViewCellWithImage() {
        sut?.loadPaths(request: APIRequestMock())
        
        let tableViewSpy = UITableViewSpy()
        let cell = sut?.cellForRow(tableView: tableViewSpy.tableView, identifier: "cell", 0)
        
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell is ImageTableViewCell, "cell should be from type ImageTableViewCell")
        XCTAssertNotNil(cell?.imageView)
    }
        
}
