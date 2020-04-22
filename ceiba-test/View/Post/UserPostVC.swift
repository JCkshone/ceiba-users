//
//  UserPostVC.swift
//  ceiba-test
//
//  Created by Jc on 22/04/20.
//  Copyright © 2020 Jc. All rights reserved.
//

import UIKit

class UserPostVC: UIViewController {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var viewModel: UserPostViewModel = UserPostViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func initViewModel() {
        viewModel.handleDataLoadComplete = { [unowned self] in
            self.tableView.reloadData()
        }
        
        viewModel.loadUserPost()
        
    }
}

extension UserPostVC {
    func setupView() {
        userName.text = viewModel.user?.name
    }
}

extension UserPostVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
