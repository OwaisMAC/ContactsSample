//
//  ViewController.swift
//  ContactsProj
//
//  Created by Owais Munawar on 4/26/19.
//  Copyright © 2019 The Dev. All rights reserved.
//

// -Loading user contacts

import UIKit
import Foundation
import Contacts

class ViewController: UIViewController {
    
    var contactIdents:[CNContact]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contactIdents = ContactSeacrh.getAllIdentifiers()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }


}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactIdents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellRow = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cellRow.textLabel?.text = (contactIdents![indexPath.row] ).givenName
        return cellRow
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

