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
    var handleDataLoadComplete: (()->())?
    
    struct Constants {
        static let userPath = "users"
    }
    
    func loadUsers() {
        http.getUsers(from: Constants.userPath) { users in
            self.users = users
            self.handleDataLoadComplete?()
        }
    }
    
    func getUser(from userId: Int) -> User? {
        let user = users.first { item -> Bool in
            return item.id == userId
        }
        return user ?? nil
    }
    
}
