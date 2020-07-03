//
//  RepositoryTableViewCell.swift
//  Git Repositories
//
//  Created by Mohamed Mostafa Fawzi on 7/1/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
}
