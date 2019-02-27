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

class NewOrEditViewController : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

 //   @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleTextView: UITextView!
    
    @IBOutlet weak var textView: UITextView!
    
    weak var delegate : NewEditDelegateProtocol?
    
    var itemToEdit: MyNotesClass?
    
    var imageTags : Int = 1
    
    
    var imageDataKeys: [Int]?
    var buttons: [UIButton]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    // If there is no image then preview one imageButton, otherwise preview the image buttons
      //  for i in 2...6 {
      //  }
        
//        for button in 0...5{
//            buttons.append(view.viewWithTag(button) as! UIButton)
//
//        }
        
        // MARK: These declaration should be after checking if there is a data inside or not
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
        
//        if imageDataKeys != nil {
//
//            for items in imageDataKeys {
//
//                // Decoding and loading
//                let data = UserDefaults.standard.object(forKey:"\(items)") as! NSData
//
//                buttons[items].image = UIImage(data: data as Data)
//            }
//
//
//        } else {
//
//            // try to do somthing else if there was no pictures selected for the note
//
//        }
        loadingTheImages()
        
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
            
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerController.SourceType.photoLibrary
            
            image.allowsEditing = false
            self.present(image, animated: true){
                //if we want to do sothing aftr presenting
                
                self.activateNextButton(nextButton: sender as! UIButton)
            }
            
            
            
            
            
            
            
//            choosePhotoFromLibrary()
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
        
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerController.SourceType.camera
            
            image.allowsEditing = false
            self.present(image, animated: true){
                //if we want to do sothing aftr presenting
                self.activateNextButton(nextButton: sender as! UIButton)
            }
            
            
            
            
//            // Here I will try to save the image
//
//            let imageData: NSData =
//                image.pngData()! as NSData
//
//            // Saved Image
//
//            UserDefaults.standard.set(imageData, forKey: "\(self.imageTags)")
//
//            self.imageDataKeys?.append(self.imageTags)
//
//            print(imageData)
//
            
            
     //       takePhotoWithCamera()
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
  
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            let imageButton = view.viewWithTag(imageTags) as! UIButton
            
            imageButton.setImage(image, for: .normal
            )
            // Here I will try to save the image
            
            let imageData: NSData =
                image.pngData()! as NSData
            
        // Saved Image
            
            UserDefaults.standard.set(imageData, forKey: "\(imageTags)")
            
            imageDataKeys?.append(imageTags)
            
            //print(imageData)
            
            
            
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    func activateNextButton(nextButton senderButton: UIButton){
        
        let imageButton = view.viewWithTag(senderButton.tag + 1)
        imageButton?.isHidden = false
        imageTags = senderButton.tag
    }
    
    
    
    
    func loadingTheImages(){
        
            if imageDataKeys != nil {
                
                for items in imageDataKeys! {
                    
                    // Decoding and loading
                    let data = UserDefaults.standard.object(forKey:"\(items)") as! NSData
                    
                    let imageButton = view.viewWithTag(items) as! UIButton
                    
                    
                    let tempImage = UIImage(data: data as Data)
                    imageButton.setImage(tempImage, for: .normal)
                }
                
                
            }
            else

            {
                
                // try to do somthing else if there was no pictures selected for the note
                
            }
            
            
            
            
            
            
   
        
        
        
        
        
        
    }
    
    
}



//extension UIImagePickerControllerDelegate {
//    // MARK:- Image Helper Methods
//    func takePhotoWithCamera() {
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = .camera
//        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
//        present(imagePicker, animated: true, completion: nil)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController,
//                               didFinishPickingMediaWithInfo info:
//        [UIImagePickerController.InfoKey : Any]) {
//        dismiss(animated: true, completion: nil)
//    }
//    func imagePickerControllerDidCancel(_ picker:
//        UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
//    func choosePhotoFromLibrary() {
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
//        present(imagePicker, animated: true, completion: nil)
//    }
//}
