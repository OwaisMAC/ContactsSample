//
//  ContactAuthorize.swift
//  ContactsProj
//
//  Created by Owais Munawar on 4/26/19.
//  Copyright © 2019 The Dev. All rights reserved.
//

import Foundation
import Contacts

public final class ContactAuthorizer{
    
    public class func authorizeContacts(completionHandler
        : @escaping (_ succeeded: Bool) -> Void){
        
        switch CNContactStore.authorizationStatus(for: .contacts){
        case .authorized:
            completionHandler(true)
        case .notDetermined:
            CNContactStore().requestAccess(for: .contacts){succeeded, err in
                completionHandler(err == nil && succeeded)
            }
        default:
            completionHandler(false)
        }
        
    }
    
}
