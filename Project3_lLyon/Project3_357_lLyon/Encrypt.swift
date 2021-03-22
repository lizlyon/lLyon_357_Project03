//
//  Encrypt.swift
//  Project3_lLyon
//
//  Created by Elizabeth Lyon on 3/17/21.
//

import Foundation
//import SwiftUI

struct Encrypt {
    static func cipher(s : String, t : Int, reverse: Bool) -> String {
        var newStr = ""
        var transAmount = t
        
        if (reverse){
            transAmount = getReverseTranslate(i: t)
        }
        for c in s {
            newStr += String(translate(l: c, intToTranslate : transAmount))
        }
        return newStr
    }
        
    static func translate(l : Character, intToTranslate : Int) -> Character{
        if let ascii = l.asciiValue{
            
            var intFinal = ascii
            
            if (ascii >= 97 && ascii <= 122){
               
                intFinal = ((ascii - 97) + UInt8(intToTranslate) % 26) + 97
            }
           
            else if (ascii >= 65 && ascii <= 98){
                
                intFinal = ((ascii - 65) + UInt8(intToTranslate) % 26) + 65
            }
            
          
            return Character(UnicodeScalar(intFinal))
        }
       
        return Character("")
    }
    
    static func getReverseTranslate(i: Int) -> Int{
        return (26 - ( i % 26 ))
    }
}
