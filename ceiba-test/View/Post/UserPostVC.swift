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
    private typealias postCell = PostItemTableViewCell
    var viewModel: UserPostViewModel = UserPostViewModel()
    
    
    struct Constants {
        static let cellName = "PostItemTableViewCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        initViewModel()
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
    
    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: Constants.cellName, bundle: Bundle.main), forCellReuseIdentifier: Constants.cellName)
    }
}

extension UserPostVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellName, for: indexPath) as! postCell
        let post = viewModel.posts[indexPath.row]
        cell.title = post.title
        cell.itemDescription = post.body
        return cell
    }
}
