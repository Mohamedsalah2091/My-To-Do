//
//  stringExtension.swift
//  To Do List
//
//  Created by MAK on 5/15/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation

extension String {
    var localized :  String{
        return NSLocalizedString(self, comment: "")
    }
}
