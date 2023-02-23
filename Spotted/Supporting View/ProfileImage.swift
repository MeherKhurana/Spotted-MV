//
//  ProfileImage.swift
//  Spotted
//
//  Created by Meher Khurana on 11/26/22.
//

import SwiftUI

struct ProfileImage: View {
    let url: URL?
    
    var body: some View {
        GeometryReader { proxy in
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                //Color.gray.opacity(0.5)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
            .clipShape(Circle())
        }
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(url: URL(string: "https://source.unsplash.com/lw9LrnpUmWw/480x480"))
    }
}
