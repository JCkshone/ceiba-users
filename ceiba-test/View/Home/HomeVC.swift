//
//  ViewController.swift
//  ceiba-test
//
//  Created by Jc on 21/04/20.
//  Copyright © 2020 Jc. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private typealias homeCell = HomeItemTableViewCell
    private let viewModel = UserViewModel()
    
    struct Constants {
        static let cellName = "HomeItemTableViewCell"
        static let cellHeight: CGFloat = 330
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        setupTableView()
        setupViewModel()
    }
    
    func setupViewModel() {
        viewModel.handleDataLoadComplete = { [unowned self] in
            self.tableView.reloadData()
        }
        
        viewModel.loadUsers()
    }
    
    func goToPost(of userId: Int) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserPostVC") as! UserPostVC
        guard let user = viewModel.getUser(from: userId) else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.viewModel.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC {
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: Constants.cellName, bundle: Bundle.main), forCellReuseIdentifier: Constants.cellName)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellName, for: indexPath) as! homeCell
        let user = viewModel.users[indexPath.row]
        cell.selectionStyle = .none
        cell.userId = user.id
        cell.name = user.name
        cell.phone = user.phone
        cell.email = user.email
        cell.setMapView(geo: Geo(lat: "21.282778", lng: "-157.829444"))
        
        cell.handleShowMore = { [unowned self] userId in
            self.goToPost(of: userId)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }
}

