//
//  NSLock.swift
//  WSchultz
//
//  Created by José Eduardo Vieira Morango on 15/11/16.
//
//

import Foundation

extension NSLock{

    
    func withCriticalScope<T>(block: () -> T) -> T{
    
        lock()
        let value = block()
        unlock()
        return value
    
    }





}
