//
//  EditPictureViewController.swift
//  NotesApp
//
//  Created by Karrar Abd Ali on 05/03/2019.
//  Copyright © 2019 Karrar Abd Ali. All rights reserved.
//

import UIKit


protocol pictureDataDelegate: class {
    func deletePicture(imageUrl: URL)
}

class EditPictureViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?
    weak var delegate:pictureDataDelegate?
    var imagePathURL : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "image"
        imageView.image = UIImage(contentsOfFile: imagePathURL!.path)
    }
    
    @IBAction func DeleteImageClicked(_ sender: Any) {
        delegate?.deletePicture(imageUrl: imagePathURL!)
    }
    
}
