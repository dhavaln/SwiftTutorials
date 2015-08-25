//
//  Clock.swift
//  Clock-iOS
//
//  Created by Dhaval Nagar on 25/08/15.
//  Copyright (c) 2015 Dhaval. All rights reserved.
//

import Foundation

class Clock {
    
    func currentTime() -> NSDate {
        return NSDate()
    }
    
    func currentTimeInShort() -> String{
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        return formatter.stringFromDate( currentTime() )
    }
}