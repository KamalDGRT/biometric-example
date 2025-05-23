//
//  NormalButton.swift
//  BiometricAuthExample
//

import SwiftUI

struct NormalButton: View {
    var title: String
    var backgroundColor: Color
    var height = 45.0
    var foregroundColor: Color
    var cornerRadius = 15.0
    var ctaAction: (() -> Void)
    
    var body: some View {
        Button(action: {
            ctaAction()
        }) {
            ZStack {
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: RoundedCornerStyle.circular
                )
                .fill(backgroundColor)
                .frame(height: height, alignment: .center)
                
                Text(title)
                    .foregroundColor(foregroundColor)
                    .fontWeight(.semibold)
            }
        }
    }
}


#Preview {
    NormalButton(
        title: "Click Here",
        backgroundColor: Color.black,
        foregroundColor: .white
    ) {}
        .padding(16)
}
