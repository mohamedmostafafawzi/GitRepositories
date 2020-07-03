//
//  UsernameViewController.swift
//  Git Repositories
//
//  Created by Mohamed Mostafa Fawzi on 7/1/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit

class UsernameViewController: UIViewController {
        
    @IBOutlet weak var usernameText: UITextField!
    
    var usernamePresenter: UsernamePresent?
    override func viewDidLoad() {
        super.viewDidLoad()
        usernamePresenter = UsernamePresenter(view: self)
    }
    
    @IBAction func getRepos(_ sender: Any) {
        let username = usernameText.text!
        UserDefaults.standard.set(username, forKey: "username")
        usernamePresenter?.validate(username: username)
    }
    
}


extension UsernameViewController: UsernameView {
    
    func navigateToRepositoriesViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let repositoriesView = storyboard.instantiateViewController(identifier: "RepositoriesViewController") as! RepositoriesViewController
        repositoriesView.modalPresentationStyle = .automatic
        self.present(repositoriesView, animated: true, completion: nil)
    }
    
}

