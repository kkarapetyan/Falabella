//
//  DetailsPresentTest.swift
//  MVPTableTestTests
//
//  Created by Karine Karapetyan on 03-05-22.
//

import XCTest
@testable import Falabella

class MockDetailsView: DetailsPresenterDelegate {
    var details: Valuta?
    func presentDetails(valuta: Valuta) {
        details = valuta
    }
}

class DetailsPresenterTest: XCTestCase {
    
    var view: MockDetailsView!
    var presenter: DetailsPresenter!
    var valuta: Valuta!

    override func setUp()  {
        view = MockDetailsView()
        presenter = DetailsPresenter(delegate: view)
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

    func testPresentDetails() {
        view.details = self.valuta
        view.presentDetails(valuta: self.valuta)
        XCTAssertTrue(view.details  != nil, "Details presented" )
    }

}
