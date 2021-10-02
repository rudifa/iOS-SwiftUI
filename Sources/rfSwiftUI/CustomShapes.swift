//
//  CustomShapes.swift
//  Set
//
//  Created by Rudolf Farkas on 12.09.21.
//

import SwiftUI

// MARK: custom Shapes

struct Diamond: InsettableShape {
    var insetAmount: CGFloat = 0

    func inset(by amount: CGFloat) -> some InsettableShape {
        var diamond = self
        diamond.insetAmount += amount
        return diamond
    }

    func insets(in rect: CGRect, insetAmount: CGFloat) -> CGPoint {
        func sqr<T: Numeric>(_ x: T) -> T { x * x }
        let diagonal = sqrt(sqr(rect.width) + sqr(rect.height))
        let insetX = insetAmount * diagonal / rect.height
        let insetY = insetAmount * diagonal / rect.width
        return CGPoint(x: insetX, y: insetY)
    }

    func path(in rect: CGRect) -> Path {
        let insets = insets(in: rect, insetAmount: insetAmount)
        let left = CGPoint(x: rect.minX + insets.x, y: rect.midY)
        let right = CGPoint(x: rect.maxX - insets.x, y: rect.midY)
        let top = CGPoint(x: rect.midX, y: rect.minY + insets.y)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY - insets.y)

        var p = Path()
        p.move(to: left)
        p.addLine(to: top)
        p.addLine(to: right)
        p.addLine(to: bottom)
        p.closeSubpath()
        return p
    }
}

struct Squiggle: InsettableShape {
    var insetAmount: CGFloat = 0

    func inset(by amount: CGFloat) -> some InsettableShape {
        var squiggle = self
        squiggle.insetAmount += amount
        return squiggle
    }

    func path(in rect: CGRect) -> Path {
        let left = CGPoint(x: rect.minX + insetAmount, y: rect.maxY)
        let right = CGPoint(x: rect.maxX - insetAmount, y: rect.minY)

        var p = Path()
        p.move(to: left)
        p.addCurve(to: right,
                   control1: CGPoint(x: rect.width * 0.25, y: rect.minY - rect.height + insetAmount * 2),
                   control2: CGPoint(x: rect.width * 0.75, y: rect.maxY + insetAmount))
        p.move(to: right)
        p.addCurve(to: left,
                   control1: CGPoint(x: rect.width * 0.75, y: rect.maxY + rect.height - insetAmount * 2),
                   control2: CGPoint(x: rect.width * 0.25, y: rect.minY - insetAmount))
        return p
    }
}

// MARK: - Demo

struct CustomShapesDemo: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack(spacing: 20) {
                Diamond()
                    .stroke(Color.red, lineWidth: 10, fill: Color.green)
                    .frame(width: 100, height: 100)
                Diamond()
                    .stroke(Color.red, lineWidth: 10, fill: Color.blue)
                    .frame(width: 100, height: 66)
                Squiggle()
                    .stroke(Color.red, lineWidth: 10, fill: Color.green)
                    .frame(width: 100, height: 100)
                Squiggle()
                    .stroke(Color.red, lineWidth: 10, fill: Color.green)
                    .frame(width: 100, height: 66)
            }

            VStack(spacing: 20) {
                Diamond()
                    .strokeBorder(Color.red, lineWidth: 10, fill: Color.green)
                    .frame(width: 100, height: 100)
                Diamond()
                    .strokeBorder(Color.red, lineWidth: 10, fill: Color.blue)
                    .frame(width: 100, height: 66)
                ZStack {
                    Squiggle()
                        .strokeBorder(Color.black, lineWidth: 10, fill: Color.pink)
                        .frame(width: 100, height: 100)
                    Squiggle()
                        .stroke(Color.yellow, lineWidth: 1)
                        .frame(width: 100, height: 100)
                }
                ZStack {
                    Squiggle()
                        .strokeBorder(Color.black, lineWidth: 10, fill: Color.pink)
                        .frame(width: 100, height: 66)
                    Squiggle()
                        .stroke(Color.yellow, lineWidth: 1)
                        .frame(width: 100, height: 66)
                }
            }
        }
    }
}

struct CustomShapesDemo_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapesDemo()
    }
}
