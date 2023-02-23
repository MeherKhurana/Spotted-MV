//
//  Post.swift
//  Spotted
//
//  Created by Meher Khurana on 11/26/22.
//

import Foundation

struct Post: Identifiable, Equatable {
    var title: String
    var content: String
    var author: User
    var date = Date()
    var location: String
    var time: String
    var intrests: String
    var imageURL: URL?
    var isFavorite = false
    var timestamp = Date()
    var id = UUID()
    
    func contains(_ string: String) -> Bool {
        let properties = [title, content, author.name, intrests].map { $0.lowercased() }
        let query = string.lowercased()
        
        let matches = properties.filter { $0.contains(query) }
        return !matches.isEmpty
    }
}

extension Post: Codable {
    enum CodingKeys: CodingKey {
        case title, content, author, imageURL, timestamp, id, location, time, date, intrests
    }
}

extension Post {
    static let testPost = Post(
        title: "",
        content: "",
        author: User.testUser,

        location: "",
        time: "",
        intrests: ""
    )
}
