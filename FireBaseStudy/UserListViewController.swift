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
    
    var postRef : FIRDatabaseReference!
    
    var usersArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postRef = FIRDatabase.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        usersArray.removeAll()
        
        self.loadData()
    }

    func loadData(){
        
        postRef.child("Users").observeSingleEvent(of: .value, with: { (snapshot:FIRDataSnapshot ) in
            
            for rest in snapshot.children.allObjects as! [FIRDataSnapshot]{
                let userId = snapshot.childSnapshot(forPath: rest.key).childSnapshot(forPath: "userId").value as! String
                self.usersArray.append(userId)
            }
            
            self.userTableView.reloadData()
        })
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let userId = usersArray[indexPath.row]
        cell.textLabel?.text = userId
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let addView = segue.destination as! UserAddViewController
        
//        addview setCallback{
//            
//        }
        
    }
    
    
    @IBAction func prepareForUnWindList(segue:UIStoryboardSegue){
        print("prepareForUnWindList")
        
        
    }
}
