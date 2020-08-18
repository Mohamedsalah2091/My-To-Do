//
//  UserModel.swift
//  To Do List
//
//  Created by MAK on 5/13/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation

protocol ID {
    var id : String? {get set}
}

struct UserModel : Codable , ID{
    var id : String? = nil
    var name : String
    var email : String
    var password : String
    var startLocation =  [String]()
    var endLocation =  [String]()
    var toDoListdate = [String]()
    var toDoListContent = [String]()
    
    init(name : String , email : String , password : String) {
        self.name = name
        self.email = email
        self.password = password

        
    }
    
}
