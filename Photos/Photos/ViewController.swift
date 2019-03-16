//
//  ViewController.swift
//  Photos
//
//  Created by Austin Sizemore on 3/14/19.
//  Copyright © 2019 Austin Sizemore. All rights reserved.
//

import UIKit

//https://www.weheartswift.com/get-images-camera-photo-library/
//Was pretty helpful

//Note that in info.plist, I added in the privacy opiton to gain access
//Description in link above of how to do so

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Link has delegate statement in functions but moved to here and it seems to work
        //to avoid having it multiple places
        imagePicker.delegate = self
    }
    
    let imagePicker = UIImagePickerController()
    
    //Difference between weak and strong?
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func openCamera(_ sender: Any) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            
            imagePicker.sourceType = .camera
            
            present(imagePicker, animated: true)
        }
        else {
            print("Camera not supported by this device")
            return
        }
    }
    
    @IBAction func openImagesFolder(_ sender: Any) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            imagePicker.sourceType = .photoLibrary
            
            present(imagePicker, animated: true)
        }
        else {
            print("Can't open photo library")
            return
        }
    }

    //In example of link, we are accepting a string: any as an index for info so need to change that in params
    //and also code when indexing info!
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        
        dismiss(animated: true)
    }
}
