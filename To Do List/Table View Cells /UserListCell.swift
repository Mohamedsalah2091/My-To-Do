//
//  UserListCell.swift
//  To Do List
//
//  Created by MAK on 5/10/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

protocol PressedCell {
    func delete(index : Int)
    func toMap(index : Int)
    
}

class UserListCell: UITableViewCell {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var userNote: UITextView!
    var deleget : PressedCell?
    @IBOutlet weak var map: UIButton!
    
    @IBOutlet weak var deletButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func pressDelete(_ sender: UIButton) {
        deleget!.delete(index : sender.tag)
    }
    
    @IBAction func pressMap(_ sender: UIButton) {
        deleget!.toMap(index: sender.tag)
    }
    
}
