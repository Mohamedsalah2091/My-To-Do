//
//  UserListPresenter.swift
//  To Do List
//
//  Created by MAK on 5/12/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit


protocol UserListView {
}

class UserListPresenter{
    
    private var view : UserListView!
    private var networkWorking = Networking()
    
    init(view : UserListView){
        self.view = view
    }
    
    func updateData(data : UserModel){
        networkWorking.update(data: data)
    }
    func deleteData(data: UserModel){
        networkWorking.delete(data: data)
    }
    func navigationToMap( start : String , end :String) ->  MapVC{
        let storyboard = UIStoryboard(name: "MapVC", bundle: .main)
        let map = storyboard.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        map.start = start
        map.end = end
        return map
    }
    
}
