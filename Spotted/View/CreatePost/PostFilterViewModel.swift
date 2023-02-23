//
//  PostFilterViewModel.swift
//  spotted
//
//  Created by Naina Khurana on 1/26/23.
//

import Foundation

enum PostFilterViewModel: Int, CaseIterable  {
    case all
    case sports
    case math
    case arts
    case science
    case healthCare
    
    var title: String {
        switch self {
        case .all: return "All"
        case .sports: return "Sports"
        case .math: return "Math"
        case .arts: return "Arts"
        case .science: return "Science"
        case .healthCare: return "Health Care"
        }
    }
}


