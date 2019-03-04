//
//  MyNotesTableViewController.swift
//  NotesApp
//
//  Created by Karrar Abd Ali on 22/02/2019.
//  Copyright © 2019 Karrar Abd Ali. All rights reserved.
//

import UIKit

class MyNotesTableViewController: UITableViewController, NewEditDelegateProtocol {
   
    

    var notesArray: [MyNotesClass] = [MyNotesClass]() //to store the notes with properties
    
    var selectedItem : MyNotesClass = MyNotesClass() // temporary file to store the current item and push it to the next ViewController
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.allowsSelection = true
       
             loadData()
       
    }
    
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (notesArray.count == 0 ? 1:notesArray.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        if notesArray.count == 0 {
         
            cell =  tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath)
            tableView.allowsSelection = false
            
        } else if notesArray.count != 0{
            tableView.allowsSelection = true
            
            cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
            let textLabel = cell?.viewWithTag(1000) as! UILabel
            let titleLabel = cell?.viewWithTag(1001) as! UILabel
            
            titleLabel.text = "\(notesArray[indexPath.row].noteTitle)"
            textLabel.text = "\(notesArray[indexPath.row].noteText)"
            
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (notesArray.count == 0 ? 534.0 :200.0)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if (self.notesArray.count == 0) {return []}
        let deleteButton = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.tableView.dataSource?.tableView!(self.tableView, commit: .delete, forRowAt: indexPath)
            return
        }
        deleteButton.backgroundColor = UIColor.gray
        return [deleteButton]
    }
    
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        notesArray.remove(at: indexPath.row)
        if !(notesArray.isEmpty) {
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }else{
            tableView.reloadData()
        }
        saveData()

    }
    // }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //selectedItem.index = indexPath.row
     //selectedItem.idNotes = notesArray[indexPath.row].idNotes
        selectedItem = notesArray[indexPath.row]
        self.performSegue(withIdentifier: "editCell", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editCell"){
            let vcEdit  = (segue.destination as! NewOrEditViewController)
            vcEdit.delegate = self
            vcEdit.itemToEdit = selectedItem
            vcEdit.segueName = "editCell"
         //   vcEdit.loadingTheData()
////            Here I am trying to send the data to the new screen to present the pictures in the buttons
//            vcEdit.itemToEdit?.picturesUrls = selectedItem?.picturesUrls
        }
        
        
        if (segue.identifier == "addNote"){
            let vcNew  = (segue.destination as! NewOrEditViewController)
            vcNew.delegate = self
            //vcNew.itemToEdit.index = notesArray.count
          vcNew.segueName = "addNote"
            //self.notesArray[]
         
        }
        
        if (segue.identifier == "newNoteSegue"){
            let NewNoteVC = segue.destination as! NewOrEditViewController
            NewNoteVC.delegate = self
            NewNoteVC.segueName = "newNoteSegue"

            
            
           
        }
    }
    

    
    
//    Protocol delegate method
    func editExcistingNote(myObject: MyNotesClass) {
        
        for (index,note) in notesArray.enumerated() where note.idNotes == myObject.idNotes {
            
            notesArray[index] = myObject
        }
        navigationController?.popViewController(animated: true)
        tableView.reloadData()
        saveData()
        
        //OLD CODE ----------------------
        
//        if notesArray.isEmpty{
//            //array is empty so append
//            notesArray.append(myObject)
//        }else{
//            notesArray[myObject.index!] = myObject
//        }
//
//      self.tableView.reloadData()
//        navigationController?.popViewController(animated: true)
//        saveData()
//        for note in notesArray where note.idnote == id
//-------------------------------
    }
    
    
    
    
    func addNewNote(myObject: MyNotesClass) {
        
        notesArray.append(myObject)
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
        
        saveData()
        
    
       //OLD CODE ------------------
//        let RowIndex = notesArray.isEmpty ? 0: notesArray.count
//        if (notesArray.isEmpty){
//           notesArray.append(myObject)
//            tableView.reloadData()
//        }else{
//        notesArray.append(myObject)
//
//       let indexPath = IndexPath(row: RowIndex, section: 0)
//
//       tableView.insertRows(at: [indexPath], with: .fade)
//
//        }
//        navigationController?.popViewController(animated: true)
//        saveData()
//

        //------------------
    }
    
    func DocumentDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func dataFilePath() -> URL{
       
        return DocumentDirectory().appendingPathComponent("Checklists.plist")
    }
    
    
    func saveData(){
        let encoder = PropertyListEncoder()
        do {
            
            let data = try encoder.encode(notesArray)
           
            try data.write(to: dataFilePath(),
                           options: Data.WritingOptions.atomic)
            print("Saved!")
        }
        catch {
            print("Error while saving the data: \(error.localizedDescription)")
            
        }
    }
    
    
    func loadData(){
        let paths = dataFilePath()
        if  let data = try? Data(contentsOf: paths) {
            let decoder = PropertyListDecoder()
            do{
                notesArray = try decoder.decode([MyNotesClass].self, from: data)
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }

    
    
}
