//
//  StorageHandler.swift
//  Project3_lLyon
//
//  Created by Elizabeth Lyon on 3/15/21.
//

import Foundation

struct StorageHandler {
    static var defaultStorage: UserDefaults = UserDefaults.standard
    
    static let defaultKey = "AllMyPasswords"
    
    //change the string array to a disctinoary object
    
    //static func setStorage(dictionary : [String:String])
    static func setStorage(input : [String]){
        
        //defaultStorage.set(object, forKey: self.defaultKey)
        defaultStorage.set(input, forKey: self.defaultKey)
    }
    
    static func getStorage() -> [String]{
        
        if let storedWords = defaultStorage.stringArray(forKey: self.defaultKey){
            
            return storedWords //as! [String : String]
        }
        else{
           
           return []  //[:]
        }
    }
}
