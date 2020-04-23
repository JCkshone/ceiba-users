//
//  UserViewModel.swift
//  ceiba-test
//
//  Created by Jc on 22/04/20.
//  Copyright © 2020 Jc. All rights reserved.
//

import Foundation

class UserViewModel {
    private let http = HttpManager.shareInstance
    var users: [User] = []
    var filterUsers: [User] = []
    var handleDataLoadComplete: (()->())?
    var handleSearchComplete: (()->())?
    
    struct Constants {
        static let userPath = "users"
    }
    
    func loadUsers() {
        http.getUsers(from: Constants.userPath) { users in
            self.users = users
            self.filterUsers = users
            self.handleDataLoadComplete?()
        }
    }
    
    func getUser(from userId: Int) -> User? {
        let user = users.first { item -> Bool in
            return item.id == userId
        }
        return user ?? nil
    }
    
    func searchUser(from user: String) {
        users.removeAll()
        if user.isEmpty {
            users = filterUsers
            handleSearchComplete?()
            return
        }
        users = filterUsers.filter{$0.name.lowercased().contains(user.lowercased())}
        handleSearchComplete?()
    }
    
}
