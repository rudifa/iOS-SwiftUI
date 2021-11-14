//
//  SwiftUIView.swift
//
//
//  Created by Rudolf Farkas on 14.11.21.
//

import SwiftUI

/* from https://stackoverflow.com/questions/58419161/issue-with-buttons-in-swiftui-on-macos

 .niceButton() defined here and applied to a Button replaces the
 default button style on the macOS which has default white background.

 .niceButton() works the same on iOS and on macOS
 */

public struct NiceButtonStyle: ButtonStyle {
    var foregroundColor: Color
    var backgroundColor: Color
    var pressedColor: Color

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 5, leading:10, bottom: 5, trailing: 10))
            .foregroundColor(foregroundColor)
            .background(configuration.isPressed ? pressedColor : backgroundColor)
            .cornerRadius(5)
    }
}

public extension View {
    func niceButton(
        foregroundColor: Color = .white,
        backgroundColor: Color = .clear,
        pressedColor: Color = .pink
    ) -> some View {
        buttonStyle(
            NiceButtonStyle(
                foregroundColor: foregroundColor,
                backgroundColor: backgroundColor,
                pressedColor: pressedColor
            )
        )
    }
}

struct NiceButtonView: View {
    var body: some View {
        Button {
            // action
        } label: {
            Text("Hello, Nice Button!")
        }
        .niceButton(foregroundColor: .blue, backgroundColor: .gray.opacity(0.3), pressedColor: .pink.opacity(0.5))
        .font(.title)
    }
}

struct NiceButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NiceButtonView()
    }
}
