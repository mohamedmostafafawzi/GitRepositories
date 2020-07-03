//
//  UsernamePresenter.swift
//  Git Repositories
//
//  Created by Mohamed Mostafa Fawzi on 7/3/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import Foundation

protocol UsernameView: NSObjectProtocol {
    func navigateToRepositoriesViewController()
}

protocol UsernamePresent {
    func validate(username: String)
}

class UsernamePresenter: UsernamePresent {
    
    weak var view: UsernameView?
    
    init(view: UsernameView) {
        self.view = view
    }
    
    func validate(username: String) {
        guard !username.isEmpty else {
            return
        }
        view?.navigateToRepositoriesViewController()
    }
}
