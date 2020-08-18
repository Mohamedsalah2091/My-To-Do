//
//  SignIn.swift
//  To Do List
//
//  Created by MAK on 5/10/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import MOLH
class SignIn: UIViewController , SignInView {
    
    var presenter : SingInPresenter!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SingInPresenter(view: self)
        logInButton.layer.cornerRadius = 10
        
        if MOLHLanguage.currentAppleLanguage() == "en" {
            email.textAlignment = .left
            password.textAlignment = .left
        }
        else{
            email.textAlignment = .right
            password.textAlignment = .right
        }
        
    }
    
    @IBAction func logInPress(_ sender: Any) {
        
        presenter.loadUserData(email: email.text!, password: password.text!) { (data) in
            if data != nil{
                self.prepareView()
                self.present(self.presenter.navigationToUserList(data : data!), animated: true)
            }else{
                self.showAlert()
            }
        }
        
    }
    
    @IBAction func signUpPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "title".localized,message: "message".localized,preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "buttomTitle".localized, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func prepareView(){
        email.text = ""
        password.text = ""
    }
    
}
