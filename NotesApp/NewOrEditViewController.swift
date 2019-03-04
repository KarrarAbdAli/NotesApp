//
//  NewOrEditViewController.swift
//  NotesApp
//
//  Created by Karrar Abd Ali on 25/02/2019.
//  Copyright © 2019 Karrar Abd Ali. All rights reserved.
//

import UIKit


protocol NewEditDelegateProtocol: class {
    func editExcistingNote(myObject: MyNotesClass)
    func addNewNote(myObject: MyNotesClass)
}

class NewOrEditViewController : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {


    
    @IBOutlet weak var titleTextView: UITextView!
    
    @IBOutlet weak var textView: UITextView!
    
    weak var delegate : NewEditDelegateProtocol?
    
    var itemToEdit: MyNotesClass = MyNotesClass()
    
    var TAG_CLICKED : Int = 100
    
    var segueName: String = ""
    

    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadButtonsInArray()
        
       
        

        if (segueName == "newNoteSegue") || (segueName == "addNote"){
            
            itemToEdit.idNotes = UUID().uuidString
            title = "Add Note"
            titleTextView.text = "Title"
            textView.text = " "
            // Do not forget to push the value in the notesArray in the previus viewcontroller
        }
        if segueName == "editCell"{
            titleTextView.text = itemToEdit.noteTitle
            textView.text = itemToEdit.noteText
            title = "Edit Note"
        }
        
        
        setupButtons()
        
    }
    
    
    
    func loadButtonsInArray(){
        for index in 100...105{
            buttons.append(self.view.viewWithTag(index) as! UIButton)
        }
    }
    
    func setupButtons(){
        for (index, pictureUrl) in itemToEdit.picturesUrls.enumerated() {
            if index < 6{
            buttons[index].setImage(UIImage(contentsOfFile: pictureUrl.path), for: .normal)
            }
        }
    }

    
     
    
    @IBAction func done() {
        
        itemToEdit.noteText = textView.text
        itemToEdit.noteTitle = titleTextView.text
       
        if (segueName == "newNoteSegue") || (segueName == "addNote"){
        
        delegate?.addNewNote(myObject: itemToEdit)

        }
        
        if segueName == "editCell" {
            delegate?.editExcistingNote(myObject: itemToEdit)
        }
        

        
    }
    
    
    @IBAction func addImageButtonClicked(_ sender: Any) {
        
        
        TAG_CLICKED = (sender as! UIButton).tag
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Choose From Library", comment: "Default action"), style: .default, handler: { _ in
            
            let imagePicker = UIImagePickerController()
             imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true){

            }
    

}))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Take Photo", comment: "Default action"), style: .default, handler: { _ in
        
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true){
               
            }
        
            
            
            
  
            
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            let imageButton = view.viewWithTag(TAG_CLICKED) as! UIButton
            
            imageButton.setImage(image, for: .normal)
            
    
         
           savingData(image: image)
            //self.activateNextButton(previousButton: imageButton)

            
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
  /*  func activateNextButton(previousButton senderButton: UIButton){
        
        let imageButton = view.viewWithTag(senderButton.tag + 1)
        imageButton?.isHidden = false
        imageTags = senderButton.tag + 1
    }*/
    
    
    
    func savingData(image: UIImage){
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!


        
        let fileName = UUID().uuidString
        
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
         itemToEdit.picturesUrls.append(fileURL)
        //try?  FileManager.default.removeItem(at: fileURL)
        let isFileExist = FileManager.default.fileExists(atPath: fileURL.path)
        if let data = image.jpegData(compressionQuality: 1.0), !isFileExist {
            do {
                //writing the image data to disk
                try data.write(to: fileURL)
                
                print("File Saved")
                print(fileURL.absoluteString)
               
            }
            catch {
                print("Error saving the file:,", error)
            }
        }else{
            print("not entering")
        }
    }
    
    
    
    
    
    
    func loadingTheData(){
        

        
        for (index, pictureUrl) in itemToEdit.picturesUrls.enumerated() {
            print(pictureUrl)
            
            let button: UIButton = view.viewWithTag(index) as! UIButton
            
            
            
            button.setImage(UIImage(contentsOfFile: pictureUrl.path), for: .normal)
    
        }
        
        
        
        
    }
}
    
    
    

