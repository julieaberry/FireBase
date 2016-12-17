//
//  ViewController.swift
//  FireBaseStudy
//
//  Created by KimSeongJoon on 2016. 12. 17..
//  Copyright © 2016년 KimSeongJoon. All rights reserved.
//

import UIKit
//import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    var postRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tmpEmail = "FireBaseUser2@mail.com"
        
        postRef = FIRDatabase.database().reference()
        
        FIRAuth.auth()?.createUser(withEmail: tmpEmail, password: "112233", completion: { (user, error) in
            
            if let error = error{
             
                print("\(error.localizedDescription)")
            }else{
                print("유저(이메일) 등록")
                
                let key = self.postRef.child("posts").childByAutoId().key
                let post = ["uid": tmpEmail]
                let childUpdates = ["/posts/\(key)": post]
                self.postRef.updateChildValues(childUpdates)
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

