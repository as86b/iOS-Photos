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
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("Camera not supported by this device")
            return
        }
            
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
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
    
}
