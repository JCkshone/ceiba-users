//
//  UserPostVC.swift
//  ceiba-test
//
//  Created by Jc on 22/04/20.
//  Copyright © 2020 Jc. All rights reserved.
//

import UIKit

class UserPostVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private typealias postCell = PostItemTableViewCell
    var viewModel: UserPostViewModel = UserPostViewModel()
    private var headerView = HeaderProfile()
    
    struct Constants {
        static let cellName = "PostItemTableViewCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        initViewModel()
        setupProfileHeader()
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
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: Constants.cellName, bundle: Bundle.main), forCellReuseIdentifier: Constants.cellName)
    }
    
    func setupProfileHeader() {
        if let user = viewModel.user {
            headerView.setUserInfo(of: user)
        }
        
        tableView.contentInset = UIEdgeInsets(top: 260, left: 0, bottom: 0, right: 0)
        view.addSubview(headerView)
        headerView.frame = CGRect(x: 0, y: 80, width: view.bounds.width, height: 250)
        headerView.setupAnimationView(animationName: "user-1")
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
        cell.selectionStyle = .none
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 260 - (scrollView.contentOffset.y + 260)
        let h = max(0, y)
        headerView.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: h)
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.alpha = y < 227.0 ? 0 : 1
        }
    }
}
