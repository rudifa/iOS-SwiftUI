//
//  StripedShapes.swift
//
//
//  Created by Rudolf Farkas on 03.10.21.
//

import SwiftUI

// MARK: - views and shape extensions

extension Shape {

    /// Stroke the shape and fill with 8 vertical stripes
    ///
    /// ````
    /// Circle().striped(lineWidth: 7)
    ///
    func striped(lineWidth: CGFloat) -> some View {
        VStripes()
            .opacity(0.5)
            .clipShape(self)
            .overlay(stroke(lineWidth: lineWidth))
    }
}

/// Draws 8 vertical stripes in the view's rectangle
struct VStripes: View {
    let numberOfStripes = 8

    var body: some View {
        GeometryReader { geometry in
            let step = geometry.size.width / CGFloat(numberOfStripes)
            let stripeWidth = step / 2
            Path { path in
                let y = geometry.size.height
                for n in 0 ... numberOfStripes {
                    let xn = CGFloat(n) * step
                    path.move(to: CGPoint(x: xn, y: 0))
                    path.addLine(to: CGPoint(x: xn, y: y))
                }
            }
            .stroke(lineWidth: stripeWidth)
        }
    }
}

// MARK: - Demo

/// Demonstrates filling a shape with vertically striped background
///
struct StripedShapesDemo: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack(spacing: 20) {
                Diamond()
                    .striped(lineWidth: 3)
                    .frame(width: 100, height: 66)
                Squiggle()
                    .striped(lineWidth: 3)
                    .frame(width: 100, height: 66)
                Capsule()
                    .striped(lineWidth: 3)
                    .frame(width: 100, height: 66)
                RoundedRectangle(cornerRadius: 6)
                    .striped(lineWidth: 3)
                    .frame(width: 100, height: 66)
            }
            .foregroundColor(.pink)

            VStack(spacing: 20) {
                Diamond()
                    .stroke(lineWidth: 3)
                    .frame(width: 100, height: 66)
                Squiggle()
                    .stroke(lineWidth: 3)
                    .frame(width: 100, height: 66)
                Capsule()
                    .stroke(lineWidth: 3)
                    .frame(width: 100, height: 66)
                RoundedRectangle(cornerRadius: 6)
                    .stroke(lineWidth: 3)
                    .frame(width: 100, height: 66)
            }
            .foregroundColor(.blue)

            VStack(spacing: 20) {
                Diamond()
                    .fill()
                    .frame(width: 100, height: 66)
                Squiggle()
                    .fill()
                    .frame(width: 100, height: 66)
                Capsule()
                    .fill()
                    .frame(width: 100, height: 66)
                RoundedRectangle(cornerRadius: 6)
                    .fill()
                    .frame(width: 100, height: 66)
            }
            .foregroundColor(.green)
        }
    }
}

///
///
struct StripedShapesDemo_Previews: PreviewProvider {
    static var previews: some View {
        StripedShapesDemo()
    }
}
