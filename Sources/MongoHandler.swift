//
//  MongoHandler.swift
//  WSchultz
//
//  Created by José Eduardo Vieira Morango on 17/11/16.
//
//

import Foundation
import MongoKitten



public class MongoHandler{


    let server: Server!
    let db: Database!
    public init(user: String, password: String, database: String , url: String = "localhost", port: String = "27017") {
        do{
            let url = "mongodb://"+user+":"+password+"@"+url+":"+port
         server = try Server(mongoURL: url , using: DefaultTCPClient, automatically: true, maxConnections: 1000)
            
            db = server[database]
        
        }catch{
        
            server = nil
            db = nil
            debugPrint("Connect DB error")

        
        }
        
        }
    
    public func save(collection: String,title: String, body: String){
    
        
        do{
            let collection = db[collection]
            let document: Document = [ "title": ~title,"body": ~body]
            let result = try collection.insert(document)
            
        }catch{
        
            debugPrint("Connect collection error")
            

        
        }
    
    }



}
