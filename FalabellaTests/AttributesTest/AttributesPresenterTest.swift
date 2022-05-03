//
//  AttributesPresenterTest.swift
//  MVPTableTestTests
//
//  Created by Karine Karapetyan on 02-05-22.
//

import XCTest
@testable import Falabella

class MockAttributesView: AttributesPresenterDelegate {
    
    var valutas: [Valuta]?
    var valuta: Valuta?
    var isShowLogin: Bool = false

    func presentAttributes(valutas: [Valuta]) {
        self.valutas = valutas
    }
    
    func presentDetails(valuta: Valuta) {
        self.valuta = valuta
    }
    
    func showLogin() {
        self.isShowLogin = true
    }
    
    
}

class AttributesPresenterTest: XCTestCase {

    var view: MockAttributesView!
    var presenter: AttributesPresenter!
    var valuta: Valuta!
    
    override func setUp()  {
        view = MockAttributesView()
        presenter = AttributesPresenter(delegate: view)
        valuta = Valuta(codigo: "test code",
                        nombre: "test name",
                        unidad_medida: "test measure",
                        fecha: "test date",
                        valor: 100)
    }

    override func tearDown()  {
        view = nil
        presenter = nil
        valuta = nil
    }
    
 

    func testPresentAttributes() {
        view.presentAttributes(valutas: [valuta])
        XCTAssertTrue(view.valutas?.count ?? 0 > 0, "Attributes presented" )
    }
    
    func testPresentDetails() {
        view.valutas = [self.valuta]
        view.presentDetails(valuta: (view.valutas?.first)!)
        XCTAssertTrue(view.valuta  != nil, "Details presented" )
    }
    
    func testShowLogin() {
        view.showLogin()
        XCTAssertTrue(view.isShowLogin, "Show login" )
    }

}
