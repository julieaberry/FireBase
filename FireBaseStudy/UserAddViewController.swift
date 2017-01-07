//
//  UserAddViewController.swift
//  FireBaseStudy
//
//  Created by KimSeongJoon on 2016. 12. 17..
//  Copyright © 2016년 KimSeongJoon. All rights reserved.
//

import UIKit
import Firebase

class UserAddViewController: UIViewController {

    var postRef: FIRDatabaseReference!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pswdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postRef = FIRDatabase.database().reference()
    }

    @IBAction func actionJoin(_ sender: AnyObject) {
        
        if emailTextField.text?.characters.count != 0{
            FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: pswdTextField.text!, completion: { (user, error) in
                
                if let error = error    {
                    
                    print("\(error.localizedDescription)")
                }else{

                    
                    let key = self.postRef.child("Users").childByAutoId().key
                    let post = ["userId": self.emailTextField.text!,
                                "passWd": self.pswdTextField.text!]
                    let childUpdates = ["/Users/\(key)": post]
                    self.postRef.updateChildValues(childUpdates, withCompletionBlock: { (error, ref) in

//                        self.callback()
                        self.performSegue(withIdentifier: "unwindToList", sender: self)
                        
                        
                    })
                }
            })
        }else{
            print("이메일 작성필요")
        }
    }
}
