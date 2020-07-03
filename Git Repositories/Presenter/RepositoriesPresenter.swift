//
//  RepositoriesPresenter.swift
//  Git Repositories
//
//  Created by Mohamed Mostafa Fawzi on 7/3/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation

protocol RepositoriesView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setRepos(repos: [Repository])
    func showAlert(title: String, message: String)
}

protocol RepositoriesPresent {
    func fetchRepos(username: String)
}

class RepositoriesPresenter: RepositoriesPresent {
    
    weak var view: RepositoriesView?
    let api: RepositoriesAPIProtocol = RepositoriesAPI()
    
    init(view: RepositoriesView) {
        self.view = view
    }
    
    func fetchRepos(username: String) {
        self.view?.startLoading()
        api.getRepos(username: username) { (result) in
            self.view?.finishLoading()
            switch result {
            case .success(let repos):
                self.view?.setRepos(repos: repos)
                print(repos)
            case .failure(let error):
                self.view?.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    
    
}
