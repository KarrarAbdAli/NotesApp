//
//  NewOrEditViewController.swift
//  NotesApp
//
//  Created by Karrar Abd Ali on 25/02/2019.
//  Copyright © 2019 Karrar Abd Ali. All rights reserved.
//

import UIKit


// here I need to creat a protocol to send and conttrol the data from the previous controller

protocol NewEditDelegateProtocol: class {
    func editExcistingNote(myObject: MyNotesClass)
    func addNewNote(myObject: MyNotesClass)
}

class NewOrEditViewController: UIViewController {

 //   @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleTextView: UITextView!
    
    @IBOutlet weak var textView: UITextView!
    
    weak var delegate : NewEditDelegateProtocol?
    
    var itemToEdit: MyNotesClass?
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    // If there is no image then preview one imageButton, otherwise preview the image buttons
      //  for i in 2...6 {
      //  }
        let imageButton1 = view.viewWithTag(1) as! UIButton
        let imageButton2 = view.viewWithTag(2) as! UIButton
        let imageButton3 = view.viewWithTag(3) as! UIButton
        
        let imageButton4 = view.viewWithTag(4) as! UIButton
        let imageButton5 = view.viewWithTag(5) as! UIButton
        let imageButton6 = view.viewWithTag(6) as! UIButton
        
        imageButton2.isHidden = true
        imageButton3.isHidden = true
        imageButton4.isHidden = true
        imageButton5.isHidden = true
        imageButton6.isHidden = true
        
        //print(itemToEdit?.noteTitle)
       
        if (itemToEdit) != nil {
        titleTextView.text = itemToEdit?.noteTitle
        textView.text = itemToEdit?.noteText
            title = "Edit Note"
        } else {
            title = "Add Note"
            titleTextView.text = "Title"
            textView.text = " "
        }
    }
    
    
    @IBAction func done() {
        
        let myObject: MyNotesClass = MyNotesClass()
//        myObject?.noteText = ""
//        myObject?.noteText = ""
        myObject.noteTitle = titleTextView.text
        myObject.noteText = textView.text
        myObject.index = itemToEdit?.index
       
        if itemToEdit != nil {
        
        delegate?.editExcistingNote(myObject: myObject as! MyNotesClass)
        
        }
        else {
            
            delegate?.addNewNote(myObject: myObject as! MyNotesClass)
        }
        
        
        
        
        
    }
    
    
    @IBAction func addImageButtonClicked(_ sender: Any) {
        
        //UIAlertControllerStyleActionSheet = 0
        
        // THE ALERTSHERE NEEDS TO BE CHANGED OR MODIFIED, TRING TO LEARN ABOUT TAKING A FOTO OR REMOVING IT
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Choose From Library", comment: "Default action"), style: .default, handler: { _ in
            
            
//
//            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//                picker.dismiss(animated: true)
//
//                guard let image = info[.editedImage] as? UIImage else {
//                    print("No image found")
//                    return
//                }
//
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Take Photo", comment: "Default action"), style: .default, handler: { _ in
            
            
//            let vc = UIImagePickerController()
//            vc.sourceType = .camera
//            vc.allowsEditing = true
//            vc.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
//           // present(vc, animated: true)
            
            
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
   // THis function to be set in the next view controller
//    func setImage(imageTag: Int){
//
//        let imageButton = view.viewWithTag(imageTag) as! UIButton
//
//        imageButton.image
//
//    }
  
    


}
