//
//  SwiftUIView.swift
//  Spotted
//
//  Created by Meher Khurana on 12/31/22.
//

import SwiftUI

struct SwiftUIView: View {
   
    var body: some View {
        Text("Intrest")
            .font(.body)
            .foregroundColor(.black)
        Button{
            print("hello")
        }label: {
            Text("Basketball")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
