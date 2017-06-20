//
//  Handler.swift
//  WSchultz
//
//  Created by José Eduardo Vieira Morango on 6/11/16.
//
//

import Foundation

class Handler{

 typealias escHandler = ( Data? ,URLResponse?, NSDate, Error?) -> Void

 func getRequest(url : URL, handler : @escaping escHandler){
    let session = URLSession.shared
    let task = session.dataTask(with: url){ (data,response,error) in
        if error == nil{
            handler(data,response, NSDate(),nil)
        }else{
            handler(nil,nil, NSDate(),error)      
        }
    }
    task.resume()
 }
  
}
