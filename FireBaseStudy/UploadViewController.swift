//
//  UploadViewController.swift
//  FireBaseStudy
//
//  Created by KimJungSu on 2017. 1. 14..
//  Copyright © 2017년 KimSeongJoon. All rights reserved.
//

import UIKit
import FirebaseStorage

class UploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didUploadButtonClicked(_ sender: Any) {
        self.loadImagePickerController()
    }

}

extension UploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func loadImagePickerController() {
        
        let vc = UIImagePickerController.init()
        
        vc.delegate = self
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
     
        picker.dismiss(animated: true) { 
            
            let storage = FIRStorage.storage()

            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            let data: Data = UIImagePNGRepresentation(image)!
            
            // Create a reference to the file you want to upload
            let storageRef = storage.reference()
            // Create a reference to "mountains.jpg"
            let mountainsRef = storageRef.child("mountains.jpg")
            
            // Upload the file to the path "images/rivers.jpg"
            _ = mountainsRef.put(data, metadata: nil, completion: { (metadata, error) in
                
                if error == nil {
                    print("upload success")
                }
                else {
                    print(error.debugDescription)
                }
            })
            

        }
        
    }

}
