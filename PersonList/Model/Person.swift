//
//  Person.swift
//  PersonList
//
//  Created by BEREZIN Stanislav on 08.09.2020.
//  Copyright © 2020 BEREZIN Stanislav. All rights reserved.
//

struct Person {
    
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    let imagePhone = "phone"
    let imageMail = "envelope"
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

extension Person {
    
    static func getPersons() -> [Person] {
        let dataManager = DataManager()
        let persons = dataManager.getPersons()
        return persons
    }
}

class DataManager {
    
    private var firstNames: [String] {
        Array(Set(names))
    }
    private var lastNames: [String] {
        Array(Set(surNames))
    }
    
    private var phones: [String] {
        Array(Set(phoneNumbers))
    }
    
    private var emails: [String] {
        Array(Set(emailAdresses))
    }
    
    private let names = ["Bob",
                         "Steve",
                         "Jack",
                         "John",
                         "Sergey"]
    
    private let surNames = ["Smith",
                            "Ivanov",
                            "Petrov",
                            "Sidorov",
                            "Dow"]
    
    private let phoneNumbers = ["8(901) 100-00-01",
                                "8(902) 100-00-02",
                                "8(903) 100-00-03",
                                "8(904) 100-00-04",
                                "8(905) 100-00-05"]
    
    private let emailAdresses = ["111@mail.ru",
                                 "222@mail.ru",
                                 "333@mail.ru",
                                 "444@mail.ru",
                                 "555@mail.ru"]
    
    func getPersons() -> [Person] {
        var persons: [Person] = []
        var firstNameIterator = firstNames.makeIterator()
        var lastNameIterator = lastNames.makeIterator()
        var phoneIterator = phones.makeIterator()
        var emailIterator = emails.makeIterator()
        
        while
            let firstName = firstNameIterator.next(),
            let lastName = lastNameIterator.next(),
            let phone = phoneIterator.next(),
            let email = emailIterator.next() {
                let person = Person(firstName: firstName,
                                    lastName: lastName,
                                    phone: phone,
                                    email: email)
                persons.append(person)
        }
        return persons
    }
}
