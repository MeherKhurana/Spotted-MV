//
//  Menu.swift
//  SimpleNotifications
//
//  Created by Meher Khurana on 1/1/23.
//

import Foundation


enum InterestBarOptions: Int, CaseIterable {
    case math
    case science
    case computerScience
    case arts
    case sports
    
    var title: String {
        switch self {
        case .math: return "Math"
        case .science: return "Science"
        case .computerScience: return "Computer Sceince"
        case .arts: return "Arts"
        case .sports: return "Sports"
        }
    }
    
    
    
}


