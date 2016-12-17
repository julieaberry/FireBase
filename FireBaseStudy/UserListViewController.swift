//
//  UserListViewController.swift
//  FireBaseStudy
//
//  Created by KimSeongJoon on 2016. 12. 17..
//  Copyright © 2016년 KimSeongJoon. All rights reserved.
//

import UIKit
import Firebase

class UserListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func actionAddView(_ sender: AnyObject) {
        
        let addView = self.storyboard?.instantiateViewController(withIdentifier: "UserAddViewController")
        self.navigationController?.pushViewController(addView!, animated: true)
    }
}
