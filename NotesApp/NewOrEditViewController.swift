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
    
    
//    var imageDataKeys: [Int]?
    var buttons: [UIButton]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    // If there is no image then preview one imageButton, otherwise preview the image buttons
      //  for i in 2...6 {
      //  }
        
//        for button in 0...5{
//            buttons.append(view.viewWithTag(button) as! UIButton)
        let imageButton1 = view.viewWithTag(1) as! UIButton
        let imageButton2 = view.viewWithTag(2) as! UIButton
        let imageButton3 = view.viewWithTag(3) as! UIButton
        
        let imageButton4 = view.viewWithTag(4) as! UIButton
        let imageButton5 = view.viewWithTag(5) as! UIButton
        let imageButton6 = view.viewWithTag(6) as! UIButton
//        }
//        if itemToEdit?.picturesUrls?.isEmpty == true {
        
        
//        I have a problem in this code
        
      //  if let variable =  itemToEdit?.picturesUrls {
//        if itemToEdit?.picturesUrls?.isEmpty == true{
//            if the urls are empty, then we are adding not edditing so we will make the butons hidden
            imageButton2.isHidden = true
            imageButton3.isHidden = true
            imageButton4.isHidden = true
            imageButton5.isHidden = true
            imageButton6.isHidden = true
     
//             loadingTheData()
          //  }
        
        if let item = itemToEdit?.picturesUrls?.first{
//            imageButton2.isHidden = true
//            imageButton3.isHidden = true
//            imageButton4.isHidden = true
//            imageButton5.isHidden = true
//            imageButton6.isHidden = true
            print(item)
             loadingTheData()
           }
            
//            if we do have urls, it means that we have a data of pictures so we will try to load them and make the buttons visible, it might be also possible to make the buttons hdden and show them or juse directly making them hidden from here
        // MARK: These declaration should be after checking if there is a data inside or not
        
//        loadingTheData()
       
       
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
       // loadingTheImages()
       // loadingTheData()
        
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
        myObject.picturesUrls = itemToEdit?.picturesUrls
        //******************I THINK I NEED TO PUT THE URLS HERE TO SEND THEM TO THE PREVIUS VIEWVONTROLLER TO SAVE THEM IN THE ARRAY WICH IN TERN WILL BE SAVED IN THE PLIST
        
//        myObject.picturesUrls
        
        
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
                
//                self.activateNextButton(previousButton: sender as! UIButton)
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
//               self.activateNextButton(previousButton: sender as! UIButton)
            }
        
            
//             Here I should try to add a functionality of saving after presentin
            
            
            
            
            
            
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
            
            imageButton.setImage(image, for: .normal)
            
            //savingData(image: image)
            // Here I will try to save the image
            
            
            //I do not need this code to make the assignment to that variable I should do it in another way
            //let imageData: NSData = image.pngData()! as NSData
            
        // Saved Image
//      I think I should save the data after pressing the done button not after loading them from the labrary or camera as the user might make the chose wrong and will try to change it later
            
   
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            //OLD MARK
//            UserDefaults.standard.set(imageData, forKey: "\(imageTags)")
//
//            imageDataKeys?.append(imageTags)
//
            //print(imageData)
          //Question, why I can not access to the class inside a methode or protocol, I am trying here to fix this bug
            self.activateNextButton(previousButton: imageButton)
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    func activateNextButton(previousButton senderButton: UIButton){
        
        let imageButton = view.viewWithTag(senderButton.tag + 1)
        imageButton?.isHidden = false
        imageTags = senderButton.tag + 1
    }
    
    
    
    func savingData(image: UIImage){
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        
        
        let fileName = "\(imageTags)"//UUID().uuidString
        
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
         itemToEdit?.picturesUrls?.append(fileURL)
        
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
        
        /*let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileName = "\(imageTags)"
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        

        if let image = UIImage(contentsOfFile: fileURL.path) {
            //UIImageView.contentMode = .scaleAspectFit
            //imageView.image = image
            
        }*/
        
        
        
        /*for (index, pictureUrl) in itemToEdit?.picturesUrls?.enumerated() ?? [].enumerated(){
            (self.view.viewWithTag(index) as! UIButton).setImage( UIImage(contentsOfFile: pictureUrl.path), for: .normal)
            
        }*/
        
        for pictureUrl in itemToEdit?.picturesUrls ?? []{
            print(pictureUrl)
        }
        
        
        
        
    }
    
    
    
    
   // THis functionn is not working so I need to change it.
//    func loadingTheImages(){
//
//            if imageDataKeys != nil {
//
//                for items in imageDataKeys! {
//
//                    // Decoding and loading
//                    let data = UserDefaults.standard.object(forKey:"\(items)") as! NSData
//
//                    let imageButton = view.viewWithTag(items) as! UIButton
//
//                   //  UIImage(contentsOfFile: <#T##String#>)
//
//                    let tempImage = UIImage(data: data as Data)
//                    imageButton.setImage(tempImage, for: .normal)
//                }
//
//
//            }
//            else
//
//            {
//
//                // try to do somthing else if there was no pictures selected for the note
//
//            }
//
//    }
    
    
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









/*
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
 
 var itemToEdit: MyNotesClass?
 
 var imageTags : Int = 1 // counter and tag saving variable
 
 
 
 var buttons: [UIButton]?
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 //let imageButton1 = view.viewWithTag(1) as! UIButton
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
 
 
 if (itemToEdit?.picturesUrls) != nil {
 
 loadingTheData()
 }
 
 
 if (itemToEdit) != nil {
 titleTextView.text = itemToEdit?.noteTitle
 textView.text = itemToEdit?.noteText
 title = "Edit Note"
 } else {
 title = "Add Note"
 titleTextView.text = " "
 textView.text = " "
 }
 
 }
 
 
 @IBAction func done() {
 
 
 itemToEdit?.noteText = textView.text
 itemToEdit?.noteTitle = titleTextView.text
 
 
 var myObject: MyNotesClass? = itemToEdit//MyNotesClass()
 
 // myObject = itemToEdit?
 //        myObject.noteTitle = titleTextView.text
 //        myObject.noteText = textView.text
 //        myObject.index = itemToEdit?.index
 //        myObject.picturesUrls = itemToEdit?.picturesUrls
 //******************I THINK I NEED TO PUT THE URLS HERE TO SEND THEM TO THE PREVIUS VIEWVONTROLLER TO SAVE THEM IN THE ARRAY WICH IN TERN WILL BE SAVED IN THE PLIST
 
 //        myObject.picturesUrls
 
 
 
 if itemToEdit != nil {
 
 delegate?.editExcistingNote(myObject: myObject as! MyNotesClass)
 
 }
 else {
 
 delegate?.addNewNote(myObject: myObject as! MyNotesClass)
 }
 
 
 
 
 
 }
 
 
 @IBAction func addImageButtonClicked(_ sender: Any) {
 
 
 let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
 alert.addAction(UIAlertAction(title: NSLocalizedString("Choose From Library", comment: "Default action"), style: .default, handler: { _ in
 
 let imagePickerController = UIImagePickerController()
 imagePickerController.delegate = self
 imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
 
 imagePickerController.allowsEditing = false
 //self.savingData(image: imagePickerController)
 self.present(imagePickerController, animated: true){
 
 }
 
 }))
 
 alert.addAction(UIAlertAction(title: NSLocalizedString("Take Photo", comment: "Default action"), style: .default, handler: { _ in
 
 let imagePickerController = UIImagePickerController()
 imagePickerController.delegate = self
 imagePickerController.sourceType = UIImagePickerController.SourceType.camera
 
 imagePickerController.allowsEditing = false
 self.present(imagePickerController, animated: true){
 
 }
 
 
 }))
 alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default, handler: { _ in
 NSLog("The \"OK\" alert occured.")
 }))
 
 self.present(alert, animated: true, completion: nil)
 
 }
 
 
 
 
 /*
 *
 *
 *   THE DELEGATE IS CALLING THIS WHEN YOU'VE PICKED A NEW PICTURE
 *
 *
 */
 func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
 if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
 {
 
 //HERE YOU HAVE A PICTURE IN THE VAR image
 
 
 
 
 let imageButton = view.viewWithTag(imageTags) as! UIButton
 
 imageButton.setImage(image, for: .normal)
 
 //   self.activateNextButton(previousButton: imageButton)
 
 savingData(image: image)
 
 }
 
 self.dismiss(animated: true, completion: nil)
 
 }
 
 
 
 
 
 
 func activateNextButton(previousButton senderButton: UIButton){
 
 let imageButton = view.viewWithTag(senderButton.tag + 1)
 imageButton?.isHidden = false
 imageTags = senderButton.tag + 1
 }
 
 
 
 func savingData(image: UIImage){
 
 
 
 let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
 
 var fileName: String = "\(imageTags)"
 
 if imageTags < 7 {
 
 fileName = "\(imageTags)"//UUID().uuidString
 } else{
 imageTags = 6
 fileName = "\(imageTags)"//UUID().uuidString
 }
 
 let fileURL = documentDirectory.appendingPathComponent(fileName)
 
 itemToEdit?.picturesUrls.append(fileURL)
 
 let isFileExist = FileManager.default.fileExists(atPath: fileURL.path)
 print(fileURL.absoluteString)
 if let data = image.jpegData(compressionQuality: 1.0) {
 do {
 //writing the image data to disk
 try data.write(to: fileURL)
 
 print("File Saved")
 print(fileURL.absoluteString)
 
 }
 catch {
 // Here I might be able to present the view controller when there is an  image
 print("Error saving the file:,", error)
 }
 }
 else{
 print("not entering")
 }
 let imageButton = view.viewWithTag(imageTags) as! UIButton
 activateNextButton(previousButton: imageButton)
 
 
 }
 
 
 
 
 
 
 func loadingTheData(){
 
 
 
 for (index, pictureUrl) in itemToEdit?.picturesUrls.enumerated() ?? [].enumerated(){
 print(pictureUrl)
 let button = view.viewWithTag(index) as! UIButton
 let image = UIImage(contentsOfFile: pictureUrl.path)
 print("YOu should be able to see the image")
 button.setImage(image, for: .normal)
 }
 
 
 
 
 }
 
 
 
 }

 */
