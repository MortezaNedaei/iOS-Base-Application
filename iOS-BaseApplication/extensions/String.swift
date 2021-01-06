//
//  File.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import Foundation
import UIKit
import CoreLocation


extension String {
    
    /**
     @sample:
     let digitsOnlyYes = "1234567890".containsOnlyDigits
     let digitsOnlyNo = "12345+789".containsOnlyDigits
     */
    var containsOnlyDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(
            from: notDigits, options: String.CompareOptions.literal, range: nil
        ) == nil
    }
    
    /**
     @sample:
     let b1 = "abcde".containsOnlyLetters // true
     let b2 = "abcde1".containsOnlyLetters // false
     */
    var containsOnlyLetters: Bool {
            let notLetters = NSCharacterSet.letters.inverted
            return rangeOfCharacter(from: notLetters, options: String.CompareOptions.literal, range: nil) == nil
        }
    
    /**
     @sample:
     let alphanumericYes = "asd3kJh43saf".isAlphanumeric
     let alphanumericNo = "Kkncs+_s3mM.".isAlphanumeric
     */
    var isAlphanumeric: Bool {
        !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    /**
     @sample:
     print("10".toInt()) // 10
     print("5.5".toInt()) // CRASH!
     print("5a".toInt()) // CRASH!
     */
    func toInt() -> Int {
            Int(self)!
        }
        
    /**
     @sample:
     print("15".toIntOrNull()) //Optional(15)
     */
    func toIntOrNull() -> Int? {
            Int(self)
        }
    
    /**
     Checking If a String Is a Valid Email Address
     @sample:
     let approved = "test@test.com".isValidEmail // true
     let rejected = "12345".isValidEmail // false
     */
    var isValidEmail: Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
        }
    
    /**
     Checking If a String Is a Valid Email Address
     @sample:
     let approved = "test@test.com".isValidEmail // true
     let rejected = "12345".isValidEmail // false
     */
    var isValidEmail2: Bool {
            matches("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        }
    
    func matches(_ expression: String) -> Bool {
            if let range = range(of: expression, options: .regularExpression, range: nil, locale: nil) {
                return range.lowerBound == startIndex && range.upperBound == endIndex
            } else {
                return false
            }
        }
    
    /**
     @sample:
     var str1 = "  a b c d e   \n"
     var str2 = str1.trimmed
     */
    var trimmed: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /**
     @sample:
     var str1 = "  a b c d e   \n"
     str1.trim()
     */
    mutating func trim() {
        self = self.trimmed
    }
    
    /**
     when develop a multilanguage app, you’ll probably need to embed some text strings in the code that’ll appear on the screen in the user’s language
     Localized Strings
     @sample: "string_id".localized
     */
    var localized: String {
            NSLocalizedString(self, comment: "")
        }
    

    /**
     @sample:
     let strDate = "2020-08-10 15:00:00"
     let date = strDate.toDate(format: "yyyy-MM-dd HH:mm:ss")
     */
    func toDate(format: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: self)
    }
    
    /**
     @sample:
     let str = "https://google.com"
     let url = str.asURL
     */
    var asURL: URL? {
        URL(string: self)
    }
    
    /**
     @sample:
     let json = "{\"hello\": \"world\"}"
     let dictFromJson = json.asDict
     */
    var asDict: [String: Any]? {
            guard let data = self.data(using: .utf8) else { return nil }
            return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        }
    
    /**
     converts the JSON array into array
     @sample:
     let json2 = "[1, 2, 3]"
     let arrFromJson2 = json2.asArray
     */
    var asArray: [Any]? {
            guard let data = self.data(using: .utf8) else { return nil }
            return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any]
        }
    
    /**
     used for styling texts
     @sample:
     let htmlString = "<p>Hello, <strong>world!</string></p>"
     let attrString = htmlString.asAttributedString
     */
    var asAttributedString: NSAttributedString? {
            guard let data = self.data(using: .utf8) else { return nil }
            return try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        }
    
    /**
     @sample:
     let strColor = "#ff0000" // Red color
     let color = strColor.toColor()
     */
    func toColor() -> UniColor? {
            UniColor(hexString: self)
        }
    
    /**
     @sample:
     let strCoordinates = "41.6168, 41.6367"
     let coordinates = strCoordinates.asCoordinates
     */
    var asCoordinates: CLLocationCoordinate2D? {
        let components = self.components(separatedBy: ",")
        if components.count != 2 { return nil }
        let strLat = components[0].trimmed
        let strLng = components[1].trimmed
        if let dLat = Double(strLat),
            let dLng = Double(strLng) {
            return CLLocationCoordinate2D(latitude: dLat, longitude: dLng)
        }
        return nil
    }
    
    /**
     Separate Characters Into Groups
     @sample:
     var cardNumber = "1234567890123456"
     cardNumber.insert(separator: " ", every: 4)
     print(cardNumber)
     // 1234 5678 9012 3456
     */
    mutating func insert(separator: String, every n: Int) {
            self = inserting(separator: separator, every: n)
        }
        
    
    /**
     Separate Characters Into Groups
     @sample:
     let pin = "7690"
     let pinWithDashes = pin.inserting(separator: "-", every: 1)
     print(pinWithDashes)
     // 7-6-9-0
     */
    func inserting(separator: String, every n: Int) -> String {
            var result: String = ""
            let characters = Array(self)
            stride(from: 0, to: count, by: n).forEach {
                result += String(characters[$0..<min($0+n, count)])
                if $0+n < count {
                    result += separator
                }
            }
            return result
    }
    
    
    /**
     iOS can calculate the size of UILabel automatically, using provided constraints, but sometimes it’s important to set the size yourself.
     This extension allows us to calculate the String width and height using the provided UIFont
     @sample:
     let text = "Hello, world!"
     let textHeight = text.height(withConstrainedWidth: 100, font: UIFont.systemFont(ofSize: 16))
     */
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
            let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

            return ceil(boundingBox.height)
        }

    /**
     @sample:
     let text = "Hello, world!"
     let textHeight = text.width(withConstrainedHeight: 100, font: UIFont.systemFont(ofSize: 16))
     */
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
            let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

            return ceil(boundingBox.width)
    }
    
    
    /**
     @sample:
     let subscript1 = "Hello, world!"[7...]
     let subscript2 = "Hello, world!"[7...11]
     */
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < start { return "" }
        return self[start..<end]
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < start { return "" }
        return self[start...end]
    }
    
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        if end < start { return "" }
        return self[start...end]
    }
    
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < startIndex { return "" }
        return self[startIndex...end]
    }
    
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < startIndex { return "" }
        return self[startIndex..<end]
    }
    
    
}
