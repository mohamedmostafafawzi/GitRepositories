//
//  RepositoriesNetworking.swift
//  Git Repositories
//
//  Created by Mohamed Mostafa Fawzi on 7/1/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation
import Alamofire

enum RepositoriesNetworking {
    case getRepos(username: String)
}

extension RepositoriesNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return Constant.Server.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getRepos(let username):
            return "/users/\(username)/repos"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getRepos:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getRepos:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    
}
