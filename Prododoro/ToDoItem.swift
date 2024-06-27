//
//  ToDoItem.swift
//  Prododoro
//
//  Created by Scholar on 6/27/24.
//

import SwiftUI
import SwiftData

@Model
class ToDoItem {
    var title: String
    var isImportant: Bool
    
    init(title:String, isImportant:Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
}


