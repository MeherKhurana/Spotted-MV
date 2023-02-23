//
//  PrimaryButtonStyle.swift
//  Spotted
//
//  Created by Meher Khurana on 11/26/22.
//

import SwiftUI

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle {
        PrimaryButtonStyle()
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        Group {
            if isEnabled {
                configuration.label
            } else {
                ProgressView()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(.black)
        .background(Color.yellow)
        .cornerRadius(10)
        .animation(.default, value: isEnabled)
    }
}

#if DEBUG
struct PrimaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPreview(disabled: false)
        ButtonPreview(disabled: true)
    }
    
    private struct ButtonPreview: View {
        let disabled: Bool
        
        var body: some View {
            Button("Login", action: {})
                .buttonStyle(.primary)
                .padding()
                .previewLayout(.device)
                .disabled(disabled)
        }
    }
}
#endif
