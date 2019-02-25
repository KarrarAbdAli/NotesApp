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
    func editExcistingNote(label: UILabel, textView: UITextView)
    func addNewNote(label: UILabel, textView: UITextView)
}

class NewOrEditViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
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
        
        print(itemToEdit?.noteTitle)
        
        
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
