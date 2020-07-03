//
//  RepositoriesAPI.swift
//  Git Repositories
//
//  Created by Mohamed Mostafa Fawzi on 7/1/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation


protocol RepositoriesAPIProtocol {
    func getRepos(username: String, completionHandler: @escaping (Result<[Repository], NSError>) -> Void)
}


class RepositoriesAPI: BaseAPI<RepositoriesNetworking>, RepositoriesAPIProtocol {
    
    func getRepos(username: String, completionHandler: @escaping (Result<[Repository], NSError>) -> Void) {
        self.fetchData(target: .getRepos(username: username), responseClass: [Repository].self) { (result) in
            completionHandler(result)
        }
    }
    
}
