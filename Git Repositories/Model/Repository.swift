//
//  Repository.swift
//  Git Repositories
//
//  Created by Mohamed Mostafa Fawzi on 7/1/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation

// MARK: - Repository
struct Repository: Codable {
    let name: String
    let htmlURL: String
    let repositoryDescription: String?
    let createdAt: String
}

extension Repository {
    enum CodingKeys: String, CodingKey {
        case name
        case htmlURL = "html_url"
        case repositoryDescription = "description"
        case createdAt = "created_at"
    }
}
