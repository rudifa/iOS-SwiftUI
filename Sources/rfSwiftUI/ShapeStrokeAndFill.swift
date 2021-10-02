//
//  ShapeStrokeAndFill.swift
//  rfSwiftUI
//
//  Created by Rudolf Farkas on 30.09.21.
//

import SwiftUI

// see https://swiftuirecipes.com/blog/stroke-and-fill-a-shape-in-swiftui
// see also https://www.swiftbysundell.com/articles/stroking-and-filling-a-swiftui-shape-at-the-same-time/

// MARK: - extensions

extension Shape {
    // stroke and fill a shape
    // eg. Circle().stroke(Color.red, lineWidth: 7, fill: Color.green)
    func stroke<StrokeStyle, FillStyle>(_ strokeStyle: StrokeStyle,
                                        lineWidth: CGFloat = 1,
                                        fill fillStyle: FillStyle) -> some View where StrokeStyle: ShapeStyle, FillStyle: ShapeStyle
    {
        stroke(strokeStyle, lineWidth: lineWidth)
            .background(fill(fillStyle))
    }
}

extension InsettableShape {
    // strokeBorder and fill a shape
    // eg. Circle().strokeBorder(Color.red, lineWidth: 7, fill: Color.green)
    func strokeBorder<StrokeStyle, FillStyle>(_ strokeStyle: StrokeStyle,
                                              lineWidth: CGFloat = 1, fill fillStyle: FillStyle) -> some View where StrokeStyle: ShapeStyle, FillStyle: ShapeStyle
    {
        strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(fill(fillStyle))
    }
}

// MARK: - Demo

struct ShapeStrokeAndFill: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack(spacing: 20) {
                Circle()
                    .stroke(Color.red, lineWidth: 2, fill: Color.green)
                    .frame(width: 100, height: 100)
                Ellipse()
                    .stroke(Color.red, lineWidth: 2, fill: Color.green)
                    .frame(width: 100, height: 60)
                Capsule()
                    .stroke(Color.blue, lineWidth: 4, fill: Color.orange)
                    .frame(width: 100, height: 60)
                RoundedRectangle(cornerRadius: CGFloat(5))
                    .stroke(Color.black, lineWidth: 10, fill: LinearGradient(
                        colors: [.blue, .red],
                        startPoint: .top,
                        endPoint: .bottom
                    ))

                    .frame(width: 100, height: 60)
                Rectangle()
                    .stroke(Color.black, lineWidth: 10, fill: LinearGradient(
                        colors: [.blue, .orange],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 100, height: 60)
            }

            VStack(spacing: 20) {
                Circle()
                    .strokeBorder(Color.red, lineWidth: 2, fill: Color.green)
                    .frame(width: 100, height: 100)
                Ellipse()
                    .strokeBorder(Color.red, lineWidth: 2, fill: Color.green)
                    .frame(width: 100, height: 60)
                Capsule()
                    .strokeBorder(Color.blue, lineWidth: 4, fill: Color.orange)
                    .frame(width: 100, height: 60)
                RoundedRectangle(cornerRadius: CGFloat(5))
                    .strokeBorder(Color.black, lineWidth: 10, fill: LinearGradient(
                        colors: [.blue, .red],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 100, height: 60)

                Rectangle()
                    .strokeBorder(Color.black, lineWidth: 10, fill: LinearGradient(
                        colors: [.blue, .orange],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 100, height: 60)
            }
        }
    }
}

struct ShapeStrokeAndFill_Previews: PreviewProvider {
    static var previews: some View {
        ShapeStrokeAndFill()
    }
}
