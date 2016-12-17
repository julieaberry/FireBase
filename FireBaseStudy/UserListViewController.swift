//
//  UserListViewController.swift
//  FireBaseStudy
//
//  Created by KimSeongJoon on 2016. 12. 17..
//  Copyright © 2016년 KimSeongJoon. All rights reserved.
//

import UIKit
import Firebase

class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.green
        
        return cell
    }
    

}
