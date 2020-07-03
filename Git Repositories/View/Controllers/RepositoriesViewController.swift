//
//  RepositoriesViewController.swift
//  Git Repositories
//
//  Created by Mohamed Mostafa Fawzi on 7/1/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit
import SafariServices
import NVActivityIndicatorView

class RepositoriesViewController: UIViewController {

    @IBOutlet weak var reposTableView: UITableView!
    
    var repos = [Repository]()
    var repositoriesPresenter: RepositoriesPresent?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
        repositoriesPresenter = RepositoriesPresenter(view: self)
        let username = UserDefaults.standard.string(forKey: "username")
        repositoriesPresenter?.fetchRepos(username: username!)
        reposTableView?.reloadData()

    }
    

}

extension RepositoriesViewController: RepositoriesView, NVActivityIndicatorViewable {
    func startLoading() {
        startAnimating(type: .ballRotateChase)
    }
    
    func finishLoading() {
        stopAnimating()
    }
    
    func setRepos(repos: [Repository]) {
        self.repos = repos
        reposTableView?.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}


// MARK:- UITableViewDataSource
extension RepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reposTableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath) as! RepositoryTableViewCell
        
        let repoName = repos[indexPath.row].name
        cell.repoName.text = repoName
        let repoDescription = repos[indexPath.row].repositoryDescription
        cell.repoDescription.text = repoDescription
        let repoDate = repos[indexPath.row].createdAt
        cell.repoDate.text = repoDate
        
        return cell
    }
        
}


// MARK:- UITableViewDelegate
extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let htmlURL = repos[indexPath.row].htmlURL
        let url = URL(string: htmlURL)
        let safari = SFSafariViewController(url: url!)
        present(safari, animated: true)
    }
     
}
// MARK:- registerCustomCells
extension RepositoriesViewController {
    func registerCustomCells() {
        let cellNib = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
        reposTableView.register(cellNib, forCellReuseIdentifier: "RepositoryTableViewCell")
    }
    
}

