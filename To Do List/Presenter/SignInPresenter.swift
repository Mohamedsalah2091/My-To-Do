//  SignInPresenter.swift
//  To Do List
//
//  Created by MAK on 5/12/20.
//  Copyright © 2020 MAK. All rights reserved.

import UIKit


protocol SignInView {
}

class SingInPresenter{
    private var view : SignInView!
    private var networkWorking = Networking()
    
    init(view : SignInView){
        self.view = view
    }
    func navigationToUserList(data : UserModel) -> UserList {
        let storyboard = UIStoryboard(name: "UserList", bundle: .main)
        let userList = storyboard.instantiateViewController(withIdentifier: "UserList") as! UserList
        userList.data = data
        return userList
    }
    func loadUserData(email:String , password :String ,completion : @escaping(UserModel?) -> Void ){
        
        if  Networking.users.isEmpty {

            networkWorking.read(objectType: UserModel.self) { (data) in
                
                Networking.users = data
                completion(self.cheekUser(email : email ,password :password , data : data))
                
            }
        }
        else{
            completion(self.cheekUser(email : email ,password :password , data : Networking.users))
        }
        
        
    }
    
    
    private func cheekUser(email : String ,password :String , data : [UserModel] ) -> UserModel?{
        
        for user in  Networking.users{
            if user.email == email && password == user.password{
                return user
            }
        }
        return nil
    }
    
}
