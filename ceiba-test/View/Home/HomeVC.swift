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
}

extension HomeVC {
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: Constants.cellName, bundle: Bundle.main), forCellReuseIdentifier: Constants.cellName)
        tableView.reloadData()
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
        cell.name = user.name
        cell.phone = user.phone
        cell.email = user.email
        cell.setMapView(geo: Geo(lat: "21.282778", lng: "-157.829444"))
        
        cell.showMore.addAction(for: .touchUpInside) {
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }
}

