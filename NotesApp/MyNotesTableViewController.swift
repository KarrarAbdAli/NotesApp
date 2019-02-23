//
//  MyNotesTableViewController.swift
//  NotesApp
//
//  Created by Karrar Abd Ali on 22/02/2019.
//  Copyright © 2019 Karrar Abd Ali. All rights reserved.
//

import UIKit

class MyNotesTableViewController: UITableViewController {

    var notesArray: [MyNotesClass] = [MyNotesClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        //self.tableView.isScrollEnabled = false
        self.tableView.allowsSelection = false
        
//        var noteOne = MyNotesClass()
//        noteOne.noteTitle = "note 1 Title"
//        noteOne.noteText = "some text of the note /n not so long max 2 line"
//        var noteTwo = MyNotesClass()
//        noteTwo.noteTitle = "Note 2 Title"
//        noteTwo.noteText = "some text of the note /n not so long max 2 line"
//
//        var noteThree = MyNotesClass()
//        noteThree.noteTitle = "Whatch a movie"
//        noteThree.noteText = "watch misssion imposible after 6 pm"
//
//        notesArray = [noteOne, noteTwo]
//notesArray.append(noteThree)
//        notesArray.append(<#T##newElement: MyNotes##MyNotes#>) .noteTitle = "Title Note"
//        notesArray[0].noteText = "some text of the note /n not so long max 2 line"
//
//
//        notesArray[1].noteText = "some text of the note 2 with also max 2 lines"
//        notesArray[1].noteTitle = "Notes 2 title"
//
//navigationBar?.background
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (notesArray.count == 0 ? 1:notesArray.count)
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
         if notesArray.count > 0{
            
            cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
            let textView = cell?.viewWithTag(1000) as! UITextView
            
            textView.text = "\(notesArray[indexPath.row].noteTitle) \n \(notesArray[indexPath.row].noteText)"
            
         } else {
            
            cell =  tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath)
        }
        
       // Kresztof methode     cell.isUserInteractionEnabled=false
        // Configure the cell...

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    //MARK: FIXME: try to implement this methode only in the case if we got some information in the array. at the currentmoent we have array only in the case of the didLoad methode so now it is not defined  if notesArray.count > 0  {}
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //tableView.separatorColor = .gray
        //cellDeleteBackground.backgroundColor = UIColor.greenColor()
         if notesArray.count > 0  {tableView.deleteRows(at: [indexPath], with: .automatic)
    }}
    

    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
        
    }
    
    
//   override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//       // tableView.deselectRow(at: indexPath, animated: true)
//        tableView.deselectRow(at: indexPath, animated: false)
//        return indexPath
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
