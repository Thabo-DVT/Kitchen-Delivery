//
//  LoginTests.swift
//  LoginTests
//
//  Created by Thabo Chesane on 2023/04/10.
//

import XCTest
@testable import Kitchen_Delivery

 class LoginTests: XCTestCase {
    
     private var delegate: MockDelegate!
     private var testViewModel: LoginViewModel!
     
     override func setUp() {
         super.setUp()
         delegate = MockDelegate()
         testViewModel = LoginViewModel(delegate: delegate, initial: KitchenServiceImplement())
     }
     
     func testLoginUserSuccess() {
         if(testViewModel.logUserIn("Admin","TestPass123")){
             XCTAssert(delegate.navToLandingPageCalled)
             XCTAssertFalse(delegate.showErrorCalled)
         }
     }
     
     
     func testLoginUserFailure(){
         if(testViewModel.logUserIn("James", "HelloWorld")){
             XCTAssert(delegate.showErrorCalled)
             XCTAssertFalse(delegate.navToLandingPageCalled)
         }
     }
     
     func testLoginUserFailureIncorrectPassword(){
         if(testViewModel.logUserIn("Admin", "HelloWorld")){
             XCTAssert(delegate.showErrorCalled)
             XCTAssertFalse(delegate.navToLandingPageCalled)
         }
     }
     
     func testLoginUserFailureIncorrectUser(){
         if( testViewModel.logUserIn("James", "TestPass123")){
            XCTAssert(delegate.showErrorCalled)
            XCTAssertFalse(delegate.navToLandingPageCalled)
     }
     }
     
     func testLoginUserFailureEmptyText(){
         if(testViewModel.logUserIn("", "")){
             XCTAssert(delegate.showErrorCalled)
             XCTAssertFalse(delegate.navToLandingPageCalled)
         }
     }
     
     
     class MockDelegate: LoginViewModelDelegate{
         var navToLandingPageCalled = false
         var showErrorCalled = false
         
         func navToLandingPage(){
             navToLandingPageCalled = true
         }
         
         func showError(error:String){
             showErrorCalled = true
         }
         
     }
    
    

}
