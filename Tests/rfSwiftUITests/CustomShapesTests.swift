@testable import rfSwiftUI
import XCTest

final class CustomShapesTests: XCTestCase {
    func test_Diamond_insets() throws {
        do {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            let insetAmount: CGFloat = 10
            let insets = Diamond().insets(in: rect, insetAmount: insetAmount)
            XCTAssertEqual(insets,  CGPoint(x: 14.142135623730951, y: 14.142135623730951))
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 200)
            let insetAmount: CGFloat = 10
            let insets = Diamond().insets(in: rect, insetAmount: insetAmount)
            XCTAssertEqual(insets,  CGPoint(x: 11.180339887498949, y: 22.360679774997898))
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 200, height: 100)
            let insetAmount: CGFloat = 10
            let insets = Diamond().insets(in: rect, insetAmount: insetAmount)
            XCTAssertEqual(insets,  CGPoint(x: 22.360679774997898, y: 11.180339887498949))
        }
    }
}
