//
//  GloballyUsed.swift
//  Connecto
//
//  Created by Jerry Ren on 5/23/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

public struct GloballyUsed {
    
    static let registrationSegue = "RegistrationSuccessful"
    static let signinginSegue = "SigninSuccessful"
    
    static let chatCelloIDMi = "chatCelloMi"
    static let chatBubbleNibMi = "ChatBubbleCellooMi"
    
    static let chatCelloIDU = "chatCelloU"
    static let chatBubbleNibU = "ChatBubbleCellooU"
    
    static let GistaStoryboardID = "Gista"
    static let OgaiStoryboardID = "Ogai"
    
    static let pikachuImageName = "SurprisedPikachu"     
    
    struct FireStore {
        static let collectionName = "messages"
        static let senderFD = "sender"
        static let bodyFD = "body"
        static let dateFD = "date"
    }
    
    static let emailSignInError = "There is no user record corresponding to this identifier. The user may have been deleted."
    
    static let passwordSignInError = "The password is invalid or the user does not have a password."
    
    // MARK: - Registration
    
    static let badEmailRegistryError = "The email address is badly formatted."
    static let emptyEmailRegistryError = "An email address must be provided."
    
    static let passwordRegistryError = "The password must be 6 characters long or more."
    
    // MARK: - MVVMs
    
    static let transactiveCelloID = "transactiveCello"
    static let createTransactionCelloID = "createTransactionCello"
}
                                
