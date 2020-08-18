//
//  ViewController.swift
//  To Do List
//
//  Created by MAK on 5/9/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import MOLH
class SignUpVc: UIViewController, SignUpView {
    
    @IBOutlet weak var nameTextFilled: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    @IBOutlet var myView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    var presenter : SignUpPresenter!
    
    @IBOutlet weak var languageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SignUpPresenter(view : self)
        signUpButton.layer.cornerRadius = 10
        languageButton.layer.cornerRadius = 3
        
        
        if MOLHLanguage.currentAppleLanguage() == "en" {
            nameTextFilled.textAlignment = .left
            emailTextField.textAlignment = .left
            passwordTextFiled.textAlignment = .left
            languageButton.setTitle("عربي", for: .normal)
        }
        else{
            nameTextFilled.textAlignment = .right
            emailTextField.textAlignment = .right
            passwordTextFiled.textAlignment = .right
            languageButton.setTitle("English", for: .normal)
        }
        
    }
    
    @IBAction func pressSignUp(_ sender: Any) {
        if presenter.cheekData(name: nameTextFilled.text!, email: emailTextField.text!, password: passwordTextFiled.text!){
            presenter.saveData(name: nameTextFilled.text!, email: emailTextField.text!, password: passwordTextFiled.text!)
            prepareView()
            present(presenter.navigationToLogIn(), animated: true)
        }else{
            showAlert()
        }
    }
    
    @IBAction func presslanguageButton(_ sender: Any) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        UIView.transition(with: myView, duration: 0.5,
                          options: [ .transitionFlipFromLeft], animations: nil,
                          completion: { (_)in
                            MOLH.reset()
        }
        )
    }
    
    
    @IBAction func SignInpress(_ sender: Any) {
        
        prepareView()
        present(presenter.navigationToLogIn(), animated: true)
    }
    
    
    func showAlert(){
        let alert = UIAlertController(title: "title".localized,message: "message".localized,preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "buttomTitle".localized, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func prepareView(){
        nameTextFilled.text = ""
        emailTextField.text = ""
    }
}
