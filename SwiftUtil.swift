//
//  SwiftUtil.swift
//  Lives_ios
//
//  Created by lk on 15/8/2.
//  Copyright (c) 2015年 kelvin. All rights reserved.
//

import Foundation

class SwiftUtil{
    
    class func numberOfSubString(subString ss : String, inString : String) -> Int! {
        if inString == "" {
            return 0
        }
        if let r = inString.rangeOfString(ss, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil){
            return 1 + numberOfSubString(subString: ss, inString: inString.substringFromIndex(r.endIndex))
            
        }else {
            return 0
        }
    }
    
    // MARK: - as the name
    class func splitByUsing(subString ss : String, inString : String) -> [String] {
        let startIndex = inString.startIndex
        let endIndex = inString.endIndex
        
        if inString == "" {
            return []
        }
        if let r = inString.rangeOfString(ss, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil) {
            [inString]
            return [inString.substringToIndex(r.startIndex)] + splitByUsing(subString: ss, inString: inString.substringFromIndex(r.endIndex))
            
            
        } else {
            return [inString]
        }
    }
    
    //MARK: - convert a NSObject object to Dictionary
    class func toDictionaryFrom(nsObject : NSObject) -> Dictionary<String,String> {
        var res = Dictionary<String,String>()
        let re = reflect(nsObject)
        let maxIndex = re.count - 1
        for r in 1...maxIndex {
            let (name, subref) = re[r]
            if let value = subref.value as? String {
                if value != "" {
                    res.updateValue(value, forKey: name)
                }
            }
        }
        return res
    }
}