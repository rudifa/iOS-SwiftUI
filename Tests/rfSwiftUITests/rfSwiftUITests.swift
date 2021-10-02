@testable import rfSwiftUI
import XCTest

final class rfSwiftUITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(rfSwiftUI().text, "Hello, World!")

        func insets(in rect: CGRect, insetAmount: CGFloat) -> CGPoint {
            func sqr<T: Numeric>(_ x: T) -> T { x * x }
            let diag = sqrt(sqr(rect.width) + sqr(rect.height))
            let insetX = insetAmount * diag / rect.width
            let insetY = insetAmount * diag / rect.height
            return CGPoint(x: insetX, y: insetY)
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            let insetAmount: CGFloat = 10
            let insets = insets(in: rect, insetAmount: insetAmount)
            print("rect: \(rect) insetAmount= \(insetAmount) insets= \(insets) ")
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 100, height: 200)
            let insetAmount: CGFloat = 10
            let insets = insets(in: rect, insetAmount: insetAmount)
            print("rect: \(rect) insetAmount= \(insetAmount) insets= \(insets) ")
        }
        do {
            let rect = CGRect(x: 0, y: 0, width: 200, height: 100)
            let insetAmount: CGFloat = 10
            let insets = insets(in: rect, insetAmount: insetAmount)
            print("rect: \(rect) insetAmount= \(insetAmount) insets= \(insets) ")
        }
    }
}
