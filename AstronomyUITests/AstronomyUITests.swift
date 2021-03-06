//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Moses Robinson on 2/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testSavingAPhotoFromDetailViewButtonTapped() {
        
        
        cellAt(0).tap()
        savePhotoButton.tap()
        alertButton.tap()
        // check that image is present.
        
    }
    
    func testViewingAnotherSolAfterButtonsTapped() {
        
        // check sol position
        nextSolButton.tap()
        previousSolButton.tap()
        previousSolButton.tap()
        nextSolButton.tap()
      //  check for original sol position.
        
    }
    
    func testBackButtonTappedInDetailView() {
        
        cellAt(0).tap()
        backButton.tap()
        // check that navbar title is collectionview sol title.
        
    }
    
    func testScrollToOffScreenCell() {
        
        collectionView.swipeUp()
        collectionView.swipeUp()
        cellAt(2).tap()
        // check that cell image is not same as previous cell image.
        
    }
    
    // MARK: - Private Functions
    
    private func cellAt(_ index: Int) -> XCUIElement {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: index)
        return cell
    }
    
    // MARK: - Variables
    
    var savePhotoButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var backButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 0)
    }
    
    var alertButton: XCUIElement {
        return app.alerts["Photo Saved!"].buttons["Okay"]
    }
    
    var collectionView: XCUIElement {
        return app.collectionViews.element
    }
    
    var app: XCUIApplication!
}
