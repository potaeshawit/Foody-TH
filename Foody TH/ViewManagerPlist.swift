//
//  PlistManager.swift
//  PlistManagerExample
//
//  Created by SANDOR NAGY on 27/05/16.
//  Copyright © 2016 Rebeloper. All rights reserved.
//

import Foundation


class ViewManagerPlist {
    static let sharedInstance = ViewManagerPlist()
    private init() {} //This prevents others from using the default '()' initializer for this class.
    
    var plistFileName:String = "ViewManager"

    func startPlistManager() {
        if let _ = Plist(name: plistFileName) {
            //print("[PlistManager] PlistManager started")
        }
    }
    
    func addNewItemWithKey(key:String, value:AnyObject) {
        //print("[PlistManager] Starting to add item for key '\(key) with value '\(value)' . . .")
        if !keyAlreadyExists(key) {
            if let plist = Plist(name: plistFileName) {
                
                let dict = plist.getMutablePlistFile()!
                dict[key] = value
                
                do {
                    try plist.addValuesToPlistFile(dict)
                } catch {
                    //print(error)
                }
                //print("[PlistManager] An Action has been performed. You can check if it went ok by taking a look at the current content of the plist file: ")
                //print("[PlistManager] \(plist.getValuesInPlistFile())")
            } else {
                //print("[PlistManager] Unable to get Plist")
            }
        } else {
            //print("[PlistManager] Item for key '\(key)' already exists. Not saving Item. Not overwriting value.")
        }
        
        
    }
    
    func removeItemForKey(key:String) {
        //print("[PlistManager] Starting to remove item for key '\(key) . . .")
        if keyAlreadyExists(key) {
            if let plist = Plist(name: plistFileName) {
                
                let dict = plist.getMutablePlistFile()!
                dict.removeObjectForKey(key)
                
                do {
                    try plist.addValuesToPlistFile(dict)
                } catch {
                    //print(error)
                }
                //print("[PlistManager] An Action has been performed. You can check if it went ok by taking a look at the current content of the plist file: ")
                //print("[PlistManager] \(plist.getValuesInPlistFile())")
            } else {
                //print("[PlistManager] Unable to get Plist")
            }
        } else {
            //print("[PlistManager] Item for key '\(key)' does not exists. Remove canceled.")
        }
        
    }
    
    func removeAllItemsFromPlist() {
        
        if let plist = Plist(name: plistFileName) {
            
            let dict = plist.getMutablePlistFile()!
            
            let keys = Array(dict.allKeys)
            
            if keys.count != 0 {
                dict.removeAllObjects()
            } else {
                //print("[PlistManager] Plist is already empty. Removal of all items canceled.")
            }
            
            do {
                try plist.addValuesToPlistFile(dict)
            } catch {
                //print(error)
            }
            //print("[PlistManager] An Action has been performed. You can check if it went ok by taking a look at the current content of the plist file: ")
            //print("[PlistManager] \(plist.getValuesInPlistFile())")
        } else {
            //print("[PlistManager] Unable to get Plist")
        }
    }
    
    func saveValue(value:AnyObject, forKey:String) {
        
        if let plist = Plist(name: plistFileName) {
            
            let dict = plist.getMutablePlistFile()!
            
            if let dictValue = dict[forKey] {
                
                if value.dynamicType != dictValue.dynamicType {
                    //print("[PlistManager] WARNING: You are saving a \(value.dynamicType) typed value into a \(dictValue.dynamicType) typed value. Best practice is to save Int values to Int fields, String values to String fields etc. (For example: '_NSContiguousString' to '__NSCFString' is ok too; they are both String types) If you believe that this mismatch in the types of the values is ok and will not break your code than disregard this message.")
                }
                
                dict[forKey] = value
                
            }
            
            do {
                try plist.addValuesToPlistFile(dict)
            } catch {
                //print(error)
            }
            //print("[PlistManager] An Action has been performed. You can check if it went ok by taking a look at the current content of the plist file: ")
            //print("[PlistManager] \(plist.getValuesInPlistFile())")
        } else {
            //print("[PlistManager] Unable to get Plist")
        }
    }
    
    func getValueForKey(key:String) -> AnyObject? {
        var value:AnyObject?
        
        
        if let plist = Plist(name: plistFileName) {
            
            let dict = plist.getMutablePlistFile()!
            
            let keys = Array(dict.allKeys)
            ////print("[PlistManager] Keys are: \(keys)")
            
            if keys.count != 0 {
                
                for (_,element) in keys.enumerate() {
                    ////print("[PlistManager] Key Index - \(index) = \(element)")
                    if element as! String == key {
                        //print("[PlistManager] Found the Item that we were looking for for key: [\(key)]")
                        value = dict[key]!
                    } else {
                        ////print("[PlistManager] This is Item with key '\(element)' and not the Item that we are looking for with key: \(key)")
                    }
                }
                
                if value != nil {
                    ////print("[PlistManager] The Element that we were looking for exists: [\(key)]: \(value)")
                    return value!
                } else {
                    //print("[PlistManager] WARNING: The Item for key '\(key)' does not exist! Please, check your spelling.")
                    return .None
                }
                
            } else {
                //print("[PlistManager] No Plist Item Found when searching for item with key: \(key). The Plist is Empty!")
                return .None
            }
            
        } else {
            //print("[PlistManager] Unable to get Plist")
            return .None
        }
        
    }
    
    func keyAlreadyExists(key:String) -> Bool {
        var keyExists = false
        
        if let plist = Plist(name: plistFileName) {
            
            let dict = plist.getMutablePlistFile()!
            
            let keys = Array(dict.allKeys)
            ////print("[PlistManager] Keys are: \(keys)")
            
            if keys.count != 0 {
                
                for (_,element) in keys.enumerate() {
                    
                    ////print("[PlistManager] Key Index - \(index) = \(element)")
                    if element as! String == key {
                        //print("[PlistManager] Checked if item exists and found it for key: [\(key)]")
                        keyExists = true
                    } else {
                        ////print("[PlistManager] This is Element with key '\(element)' and not the Element that we are looking for with Key: \(key)")
                    }
                }
                
            } else {
                ////print("[PlistManager] No Plist Element Found with Key: \(key). The Plist is Empty!")
                keyExists =  false
            }
            
        } else {
            ////print("[PlistManager] Unable to get Plist")
            keyExists = false
        }
        
        return keyExists
    }
    
}


