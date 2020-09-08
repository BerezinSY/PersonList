//
//  DetailPersonVC.swift
//  PersonList
//
//  Created by BEREZIN Stanislav on 08.09.2020.
//  Copyright © 2020 BEREZIN Stanislav. All rights reserved.
//

import UIKit

class DetailPersonVC: UIViewController {
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!

    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.text = person.fullName
        phone.text = person.phone
        email.text = person.email
    }
}
