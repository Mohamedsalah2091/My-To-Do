//
//  TableViewUserList.swift
//  To Do List
//
//  Created by MAK on 5/11/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

enum DateState : String , CaseIterable {
    case ToDay
    case UpComing
    case Passed
}

extension UserList : PressedCell{
    
    func prepareTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundView = UIImageView(image: UIImage(named: "background 2"))
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib (nibName: "UserListCell", bundle:  nil ), forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.toDoListdate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserListCell
        
        cell.deleget = self
        cell.deletButton.tag = indexPath.row
        cell.map.tag = indexPath.row
        cell.date.text =  data.toDoListdate[indexPath.row]
        cell.userNote.text =  data.toDoListContent[indexPath.row]
        
        return cell;
    }
    
    func date(cellDate : Date, toDay : Date) -> DateState {
        if cellDate.removeTimeStamp! > toDay.removeTimeStamp!{
            return .UpComing
        }else if cellDate.removeTimeStamp! < toDay.removeTimeStamp!{
            return .Passed
        }
        return .ToDay
    }
    
    
    
    
    
    func delete(index: Int) {
        data.toDoListdate.remove(at: index)
        data.toDoListContent.remove(at: index)
        if index < data.startLocation.count{
            data.startLocation.remove(at: index)
            data.endLocation.remove(at: index)
        }
        presenter.updateData(data: data)
        tableView.reloadData()
    }
    
    func toMap(index: Int) {
        let start = data.startLocation.count > index ? data.startLocation[index] : ""
        let end = data.endLocation.count > index ? data.endLocation[index] : ""
        
        let vc = presenter.navigationToMap(start: start, end: end)
        vc.send = self
        vc.cellIndex = index
        present(vc, animated: true)
        
    }
    
    
    
    
}
extension Date {
    public var removeTimeStamp : Date? {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
            return nil
        }
        return date
    }
}
