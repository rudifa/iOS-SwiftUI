@testable import rfSwiftUI
import XCTest

final class CustomShapesTests: XCTestCase {
    func test_Diamond_insets() throws {
        do {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            let diamond = Diamond()
            XCTAssertEqual(diamond.path(in: rect).description, "0 50 m 50 0 l 100 50 l 50 100 l h")
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            let insetAmount: CGFloat = 10
            let insets = Diamond().insets(in: rect, insetAmount: insetAmount)
            XCTAssertEqual(insets, CGPoint(x: 14.142135623730951, y: 14.142135623730951))
            let diamond = Diamond(insetAmount: insetAmount)
            XCTAssertEqual(diamond.path(in: rect).description, "14.1421 50 m 50 14.1421 l 85.8579 50 l 50 85.8579 l h")
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 200)
            let insetAmount: CGFloat = 10
            let insets = Diamond().insets(in: rect, insetAmount: insetAmount)
            XCTAssertEqual(insets, CGPoint(x: 11.180339887498949, y: 22.360679774997898))
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 200, height: 100)
            let insetAmount: CGFloat = 10
            let insets = Diamond().insets(in: rect, insetAmount: insetAmount)
            XCTAssertEqual(insets, CGPoint(x: 22.360679774997898, y: 11.180339887498949))
        }
        do {
            // verify that (width: 0, height: 0) does not cause return value of (nan,nan)
            let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
            let insetAmount: CGFloat = 10
            let insets = Diamond().insets(in: rect, insetAmount: insetAmount)
            XCTAssertEqual(insets, CGPoint(x: 0.0, y: 0.0))
        }
    }

    func test_Hexagon_insets() throws {
        do {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            let hexagon = Hexagon()
            XCTAssertEqual(hexagon.path(in: rect).description, "100 50 m 75 93.3013 l 25 93.3013 l 0 50 l 25 6.69873 l 75 6.69873 l h")
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 200)
            let hexagon = Hexagon()
            XCTAssertEqual(hexagon.path(in: rect).description, "100 100 m 75 143.301 l 25 143.301 l 0 100 l 25 56.6987 l 75 56.6987 l h")
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 200, height: 100)
            let hexagon = Hexagon()
            XCTAssertEqual(hexagon.path(in: rect).description, "150 50 m 125 93.3013 l 75 93.3013 l 50 50 l 75 6.69873 l 125 6.69873 l h")
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            let insetAmount: CGFloat = 10
            let diamond = Hexagon(insetAmount: insetAmount)
            XCTAssertEqual(diamond.path(in: rect).description, "90 50 m 70 84.641 l 30 84.641 l 10 50 l 30 15.359 l 70 15.359 l h")
        }
    }
}
