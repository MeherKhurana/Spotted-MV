//
//  MenueOptionList.swift
//  SimpleNotifications
//
//  Created by Meher Khurana on 1/1/23.
//

import SwiftUI

struct InterestOptionList: View {
    @Binding var selectedOption: InterestBarOptions
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(InterestBarOptions.allCases, id: \.self) { item in
                    VStack{
                        Text(item.title)
                                .foregroundColor(item == selectedOption ? .black : .gray)
                            
                            if selectedOption == item {
                                Capsule()
                                    .fill(.black)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            }
                            else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            }
                    }
                    .onTapGesture {
                        self.selectedOption = item
                    }
                   
                    }
            }
        }
    }
}

struct MenueOptionList_Previews: PreviewProvider {
    static var previews: some View {
        InterestOptionList(selectedOption: .constant(.science))
    }
}
