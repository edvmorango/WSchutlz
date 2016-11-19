//
//  String.swift
//  WSchultz
//
//  Created by José Eduardo Vieira Morango on 16/11/16.
//
//
import Foundation


extension String{


    
    func removeHTMLTags() -> String{
    
    return replacingOccurrences(of: "<[^>]+>", with: self, options: .regularExpression , range: nil)
        
    }

 public   func getStringBetweenStrings(beginString: String, endString : String) -> String?{
    
    
    
        let text = self
        
        var substring: String?
        if let startRange = text.range(of:beginString), let endRange = text.range(of:endString) {
        
            
            
            if(startRange.upperBound < endRange.lowerBound){
           substring  = text[startRange.upperBound..<endRange.lowerBound].replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            }
    }
        return substring
    
    
    }
    
}
