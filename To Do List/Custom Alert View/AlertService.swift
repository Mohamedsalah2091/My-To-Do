//
//  AlertService.swift
//  To Do List
//
//  Created by MAK on 5/11/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

protocol SendData {
    func addNewData(date : String ,content : String )
}
class AlertService: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    let datapicker = UIDatePicker()
    var delegate: SendData?
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 10
        alertView.layer.cornerRadius = 15
        backGroundImage.layer.cornerRadius = 15
        createDatePicker()
    }
    
    @IBAction func pressSaveButton(_ sender: Any) {
        self.delegate?.addNewData(date:dateTextField.text! , content :contentTextField.text! )
        dismiss(animated: true)
    }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonPress))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelButtonPress))
        
        toolbar.setItems([doneButton , spaceButton , cancelButton], animated: true)
        
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datapicker
        datapicker.datePickerMode = .date
        
    }
    @objc func doneButtonPress (){
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTextField.text = formatter.string(from: datapicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelButtonPress (){
        self.view.endEditing(true)
    }
    
    
}
