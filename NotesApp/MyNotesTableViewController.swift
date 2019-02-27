//
//  MyNotesTableViewController.swift
//  NotesApp
//
//  Created by Karrar Abd Ali on 22/02/2019.
//  Copyright © 2019 Karrar Abd Ali. All rights reserved.
//

import UIKit

class MyNotesTableViewController: UITableViewController, NewEditDelegateProtocol {
   
    

    var notesArray: [MyNotesClass] = [MyNotesClass]()
    
    var selectedItem : MyNotesClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        //self.tableView.isScrollEnabled = false
        self.tableView.allowsSelection = true
       // self.tableView.isUserInteractionEnabled = true
     loadData()
        
        
        //Now Tring to save and load the adata
//        let noteOne = MyNotesClass()
//        noteOne.noteTitle = "note 1 Title"
//        noteOne.noteText = "some text of the note \n not so long max 2 line"
//        let noteTwo = MyNotesClass()
//        noteTwo.noteTitle = "Note 2 Title"
//        noteTwo.noteText = "some text of the note \n not so long max 2 line"
//
//
//        notesArray = [noteOne, noteTwo]
//----------------
        
        
        
//        notesArray.append(MyNotes) .noteTitle = "Title Note"
//        notesArray[0].noteText = "some text of the note /n not so long max 2 line"
//
//
//        notesArray[1].noteText = "some text of the note 2 with also max 2 lines"
//        notesArray[1].noteTitle = "Notes 2 title"

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
        if notesArray.count == 0 {
         
            cell =  tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath)
            tableView.allowsSelection = false
            
        } else if notesArray.count != 0{
            tableView.allowsSelection = true
            
            cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
            let textLabel = cell?.viewWithTag(1000) as! UILabel
            let titleLabel = cell?.viewWithTag(1001) as! UILabel
            
            titleLabel.text = "\(notesArray[indexPath.row].noteTitle)"
            textLabel.text = " \(notesArray[indexPath.row].noteText)"
            
        }
        
       // Kresztof methode     cell.isUserInteractionEnabled=false
        // Configure the cell...

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (notesArray.count == 0 ? 534.0 :200.0)
    }
    
    
    //while !(notesArray.isEmpty){
    
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
        //tableView.separatorColor = .gray
        //cellDeleteBackground.backgroundColor = UIColor.greenColor()
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
        //print("Clicked!")
        selectedItem = notesArray[indexPath.row]
        selectedItem?.index = indexPath.row
        self.performSegue(withIdentifier: "editCell", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editCell"){
            let vcEdit  = (segue.destination as! NewOrEditViewController)
            vcEdit.delegate = self
            vcEdit.itemToEdit = selectedItem
            vcEdit.loadingTheImages()
        }
        
        
        if (segue.identifier == "addNote"){
            let vcNew  = (segue.destination as! NewOrEditViewController)
            vcNew.delegate = self
            vcNew.itemToEdit?.index = notesArray.count + 1
            vcNew.loadingTheImages()
        }
        
        if (segue.identifier == "newNoteSegue"){
            let NewNoteVC = segue.destination as! NewOrEditViewController
            NewNoteVC.delegate = self
            //NewNoteVC.itemToEdit?.index = 0
            
             NewNoteVC.itemToEdit?.index = 0
            NewNoteVC.loadingTheImages()
            // It can be also the same merged with the previus if
        }
    }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
        
    }
    
    
    
    func editExcistingNote(myObject: MyNotesClass) {
        // print("editExcisting...")
      notesArray[myObject.index!] = myObject
      self.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        saveData()
        

    }
    
    
    
    func addNewNote(myObject: MyNotesClass) {
        let RowIndex = notesArray.isEmpty ? 0: notesArray.count
        if (notesArray.isEmpty){
           notesArray.append(myObject)
            tableView.reloadData()
        }else{
        notesArray.append(myObject)
      //  self.tableView.reloadData() // insertRowAt
       // tableView.beginUpdates()
       let indexPath = IndexPath(row: RowIndex, section: 0)
        //indexPath = [indexPath]
       tableView.insertRows(at: [indexPath], with: .fade)
      //  tableView.endUpdates()
        }
        navigationController?.popViewController(animated: true)
        saveData()
       // let indexpath = IndexPath(row: myObject.index!, section: 1)
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
