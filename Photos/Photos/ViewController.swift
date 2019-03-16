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
        
        imagePicker.delegate = self
    }
    
    let imagePicker = UIImagePickerController()
    
    //Difference between weak and strong?
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func openCamera(_ sender: Any) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            print("Camera not supported by this device")
            return
        }
    }
    
    
    @IBAction func openImagesFolder(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("Can't open photo library")
            return
        }
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // get the image
        guard let image = info[UIImagePickerControllerOriginalImage.] as? UIImage else {
            return
        }
        
        // do something with it
        imageView.image = image
    }
}
