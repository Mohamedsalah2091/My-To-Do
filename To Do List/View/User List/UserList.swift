//
//  UserList.swift
//  To Do List
//
//  Created by MAK on 5/10/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

struct Time{
    var toDay = [String]()
    var pasted = [String]()
    var upComing = [String]()
}

class UserList: UIViewController , UITableViewDataSource , UITableViewDelegate, UserListView {
    
    @IBOutlet weak var tableView: UITableView!
    var alert = AlertShow()
    var data : UserModel!
    var vc = AlertService()
    var presenter : UserListPresenter!
    var dateState = Time()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        presenter = UserListPresenter(view: self)
    }
    
    @IBAction func pressBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressAddCellButton(_ sender: Any) {
        let vc = alert.alert()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    
}
extension UserList: SendData , passData {
    
    func location(start: String, end: String , cellIndex : Int) {
      
        if data.startLocation.count > cellIndex{
            data.startLocation[cellIndex] = start
            data.endLocation[cellIndex] = end
        }else{
            data.startLocation.append(start)
            data.endLocation.append(end)
        }
        
    }
    
    func addNewData(date: String, content: String) {
        if !date.isEmpty && !content.isEmpty{
            data.toDoListdate.append(date)
            data.toDoListContent.append(content)
            tableView.reloadData()
            presenter.updateData(data: data)
        }
    }
    
    
}
