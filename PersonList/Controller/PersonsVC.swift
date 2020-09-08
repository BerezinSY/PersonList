//
//  PersonsVC.swift
//  PersonList
//
//  Created by BEREZIN Stanislav on 08.09.2020.
//  Copyright © 2020 BEREZIN Stanislav. All rights reserved.
//

import UIKit

class PersonsVC: UITableViewController {
    
    private let persons = Person.getPersons()
    private var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        person = persons[indexPath.row]
        cell.textLabel?.text = person?.fullName
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Transition
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let detailPersonVC = segue.destination as? DetailPersonVC,
            let selectedCell = tableView.indexPathForSelectedRow?.row
            else { return }
        person = persons[selectedCell]
        detailPersonVC.person = person
    }
}

// MARK: - TabBarController delegate
extension PersonsVC: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard
            let navigationVC = viewController as? UINavigationController,
            let contactVC = navigationVC.topViewController as? ContactsVC
            else { return }
        contactVC.persons = persons
    }
}
