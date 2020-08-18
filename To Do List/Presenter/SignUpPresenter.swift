//
//  SignUpPresenter.swift
//  To Do List
//
//  Created by MAK on 5/12/20.
//  Copyright © 2020 MAK. All rights reserved.
//


import UIKit

protocol SignUpView {
}

class SignUpPresenter{
    
    private var view : SignUpView!
    private var networkWorking = Networking()
    
    init(view : SignUpView){
        self.view = view
    }
    
    func cheekData(name:String , email:String , password : String )->Bool{
        if cheekstring(name) &&  cheekstring(email) && cheekstring(password){
            return true
        }
        return false
    }
    func navigationToLogIn() -> SignIn {
        let storyboard = UIStoryboard(name: "SignIn", bundle: .main)
        let signIn = storyboard.instantiateViewController(withIdentifier: "SignIn") as! SignIn
        return signIn
    }
    
    private func cheekstring(_ text :String)->Bool{
        if text != "" && !text.isEmpty{
            return true
        }
        return false
    }
    func saveData(name: String , email:String , password :String){
        networkWorking.create(data: UserModel(name: name, email: email, password: password))
    }
    
}
