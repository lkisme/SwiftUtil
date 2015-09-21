//
//  SwiftUtil.swift
//  Lives_ios
//
//  Created by lk on 15/8/2.
//  Copyright (c) 2015年 kelvin. All rights reserved.
//

import Foundation

class SwiftUtil{
    
    //MARK: - 使用 字符"s" 分割字符串"s"
    class func spilt(string : String, usingCharactor : Character) -> [String]{
        
        var index = string.startIndex
        var res : [String] = []
        if string == "" {
            return res
        }
        for c in string {
            if c == usingCharactor {
                res.append(string.substringToIndex(index))
                let result = res.join([[],spilt(string.substringFromIndex(index.successor()), usingCharactor: usingCharactor)])
                return result
            }
            index = index.successor()
        }
        res.append(string)
        return res
    }
    
    class func include(character char : Character, inString : String) -> Bool {
        for c in inString {
            if c == char {
                return true
            }
        }
        return false
    }
    class func numberOfSubString(subString ss : String, inString : String) -> Int! {
        var res = 0
        var startIndex = inString.startIndex
        let endIndex = inString.endIndex
        
        while endIndex > startIndex {
            if let r = inString.rangeOfString(ss, options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range(start: startIndex, end: endIndex), locale: nil) {
                startIndex = r.endIndex.successor()
                res++
            } else {
                return res
            }
            
        }
        return res
    }
    class func numberOfSubString2(subString ss : String, inString : String) -> Int! {
        if inString == "" {
            return 0
        }
        if let r = inString.rangeOfString(ss, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil){
            return 1 + numberOfSubString2(subString: ss, inString: inString.substringFromIndex(r.endIndex))
            
        }else {
            return 0
        }
    }

    class func splitBySubString(subString ss : String, inString : String) -> [String] {
        var res :[String] = []
        var tempString = inString
        var startIndex = inString.startIndex
        let endIndex = inString.endIndex
        
        while endIndex > startIndex {
            if let r = inString.rangeOfString(ss, options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range(start: startIndex, end: endIndex), locale: nil) {
                //            if let r = tempString.rangeOfString(ss, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil) {
                res.append(inString.substringWithRange(Range(start: startIndex, end: r.startIndex)))
                startIndex = r.endIndex
            } else {
                res.append(inString.substringWithRange(Range(start: startIndex, end: endIndex)))
                return res
            }
            
        }
        return res
    }
    class func splitByUsing2(subString ss : String, inString : String) -> [String] {
        let startIndex = inString.startIndex
        let endIndex = inString.endIndex
        
        if inString == "" {
            return []
        }
        if let r = inString.rangeOfString(ss, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil) {
            [inString]
            return [inString.substringToIndex(r.startIndex)] + splitByUsing2(subString: ss, inString: inString.substringFromIndex(r.endIndex))
            
            
        } else {
            return [inString]
        }
    }
}