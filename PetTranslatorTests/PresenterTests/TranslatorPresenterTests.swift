//
//  TranslatorPresenterTests.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 14/02/2025.
//

import XCTest
@testable import PetTranslator

import XCTest
@testable import PetTranslator

final class TranslatorPresenterTests: XCTestCase {
    
    var presenter: TranslatorPresenter!
    var mockViewDelegate: MockTranslatorPresenterDelegate!
    
    override func setUp() {
        super.setUp()
        mockViewDelegate = MockTranslatorPresenterDelegate()
        presenter = TranslatorPresenter(viewDelegate: mockViewDelegate)
    }
    
    override func tearDown() {
        presenter = nil
        mockViewDelegate = nil
        super.tearDown()
    }
    
    func testMicrophonePermissionDenied_ShowsAlert() {
        // When
        presenter.didDenyMicrophonePermission()
        // Then
        XCTAssertTrue(mockViewDelegate.didShowPermissionDeniedAlert)
    }
    
    func testDidFinishRecording_TriggersTranslation() {
        // When
        presenter.didFinishRecording()
        // Then
        XCTAssertTrue(mockViewDelegate.didUpdateUIForProcessing)
    }
    
    func testDidTranslateText_NavigatesToResult() {
        // Given
        let expectedText = "Test translation"
        // When
        presenter.didTranslateText(expectedText)
        // Then
        XCTAssertTrue(mockViewDelegate.didNavigateToResult)
        XCTAssertEqual(mockViewDelegate.lastTranslatedText, expectedText)
    }
    
}
