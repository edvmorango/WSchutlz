//
//  WSOperation.swift
//  WSchultz
//
//  Created by José Eduardo Vieira Morango on 15/11/16.
//
//

import Foundation

public class WSOperation: Operation{


    override public var isAsynchronous: Bool {return true}
    
    private let stateLock = NSLock()
    
    private var _executing: Bool = false
    
    
    override private(set) public var isExecuting: Bool{
    
        get{
            return stateLock.withCriticalScope{ _executing}
        }set{
            willChangeValue(forKey: "isExecuting")
            stateLock.withCriticalScope{ _executing = newValue}
            didChangeValue(forKey: "isExecuting")
            
        }
     
    }
   
    private var _finished = false
    
    override private(set) public var isFinished: Bool{
        
        get{
            return stateLock.withCriticalScope{ _finished}
        }set{
            willChangeValue(forKey: "isFinished")
            stateLock.withCriticalScope{ _finished = newValue}
            didChangeValue(forKey: "isFinished")
            
        }
        
    }
    
    
    public func completeOperation(){
        if isExecuting{
            isExecuting = false
        }
        
        if !isFinished{
        
            isFinished = true
        }
    
    }
    
    override public func start() {
        if isCancelled{
            isFinished = true
            return
        }
        
        isExecuting = true
        
        main()
        
    }
    
    
    
    
    
    

}
