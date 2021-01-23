//
//  LiveData.swift
//
//  Created by magesh on 03/12/20.
//

import Foundation

final class LiveData<V: Any, E: Error> {
    
    var error: E? {
        didSet {
            if let error = error {
                observeError?(error)
            }
        }
    }
    
    var value: V?  {
        didSet {
            if let value = value {
                observeValue?(value)
            }
        }
    }
    
    init(value: V?){
        self.value = value
    }
    
    init(){
        self.value = nil
    }
    
    var observeValue: ((V)->Void)?
    var observeError: ((E)->Void)?
    
}
