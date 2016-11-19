//
//  WSRequest.swift
//  WSchultz
//
//  Created by José Eduardo Vieira Morango on 15/11/16.
//
//

import Foundation



public class WSRequest: WSOperation{


    let url: URL
    let session : URLSession
    let completionHandler: (Data?, URLResponse?, Error?) -> ()
    

   public init(url: URL,session: URLSession, completionHandler: @escaping (Data?, URLResponse?, Error?) -> () ) {
   
        self.url = url
        self.session = session
        self.completionHandler = completionHandler
        
        super.init()
    
    
    
    }
    
    
    private weak var task: URLSessionTask?
    
    override public func main() {
        
         self.task =  session.dataTask(with: url){ data,response,error in
            
            self.completionHandler(data,response,error)
            self.completeOperation()
        
        }
        
        
        self.task!.resume()
        
        
    }
    
    override public func cancel() {
        self.task?.cancel()
        super.cancel()
    }
    
    
    
    
    

}
