//
//  File.swift
//  NotesApp
//
//  Created by Karrar Abd Ali on 22/02/2019.
//  Copyright © 2019 Karrar Abd Ali. All rights reserved.
//

import Foundation

class MyNotesClass : NSObject, Codable{
    
    var noteTitle:String = ""
    var noteText = ""
    var index: Int? 
    
}


//return (listOfNotes == 0 ? 1 : listOfNotes.count)
