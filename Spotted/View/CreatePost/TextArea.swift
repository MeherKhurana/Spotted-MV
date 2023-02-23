//
//  TextArea1.swift
//  Na
//
//  Created by Meher Khurana on 1/2/23.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            TextEditor(text: $text)
                
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.top,8)
                    .padding(.leading, 8)
            }
        }
        .font(.body)
    }
}




