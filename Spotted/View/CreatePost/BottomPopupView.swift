//
//  Created by Artem Novichkov on 20.05.2021.
//

import SwiftUI

struct BottomPopupView<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                content
                    .background(Color.white)
                    .cornerRadius(16, corners: [.allCorners])
                Spacer()
            }
            .shadow(color: .gray, radius: 40)
            .frame(width: 370, height: 600)
            .padding(.leading,10)
        }
        .animation(.easeOut)
        .transition(.move(edge: .bottom))
    }
}
