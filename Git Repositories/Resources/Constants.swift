//
//  Constants.swift
//  Git Repositories
//
//  Created by Mohamed Mostafa Fawzi on 7/1/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation

struct Constant {
    
    struct Server {
        static let baseURL = "https://api.github.com"
    }
    
}

enum Header: String {
    case acceptType = "Accept"
    case contentType = "Content-Type"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
