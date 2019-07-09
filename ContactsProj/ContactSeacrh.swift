//
//  ContactSeacrh.swift
//  ContactsProj
//
//  Created by Owais Munawar on 4/26/19.
//  Copyright © 2019 The Dev. All rights reserved.
//

import Foundation
import Contacts

class ContactSeacrh {
    
    private static let store = CNContactStore()
    static func searchContacts(){
        let predicate = CNContact.predicateForContacts(matchingName: "john")
        let toFetch = [CNContactGivenNameKey as NSString, CNContactFamilyNameKey
            as NSString]
        do{
            let contacts = try
            store.unifiedContacts(
                matching: predicate, keysToFetch: toFetch)
            
            for contact in contacts{
                print(contact.givenName)
                print(contact.familyName)
                print(contact.identifier)
            }
            
        } catch let err{
            print(err)
        }
    }
    
    // Used to seed a Contact Cache with all identifiers
    static func getAllIdentifiers() -> [CNContact]{
        
        // keys to fetch from store
        let minimumKeys: [CNKeyDescriptor] = [
            CNContactIdentifierKey as CNKeyDescriptor
        ]
        
        // contact request
        let request = CNContactFetchRequest(keysToFetch: minimumKeys)
        
        // dictionary to hold results, phone number as key
        var results: [CNContact] = []
        
        do {
            try store.enumerateContacts(with: request) { contact, stop in
                results.append(contact)
            }
        } catch let enumerateError {
            print(enumerateError.localizedDescription)
        }
        
        return results
    }
    
    // retreive a contact using an identifier
    // fetch keys lists any CNContact Keys you need
    static func get(withIdentifier identifier: String, keysToFetch: [CNKeyDescriptor]) -> CNContact? {
        
        var result: CNContact?
        do {
            result = try store.unifiedContact(withIdentifier: identifier, keysToFetch: keysToFetch)
        } catch {
            print(error)
        }
        
        return result
    }
    
}
