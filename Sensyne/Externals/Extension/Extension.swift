//
//  Extension.swift
//  Sensyne
//
//  Created by Melwin Jose Kottayil on 1/21/20.
//  Copyright © 2020 TestEnvironment. All rights reserved.
//

import Foundation
import UIKit

var hospitalJSONList : [AnyObject] = []

func convertToDictionary(list: [[String:String]]) -> Any? {
    let dataSet = try! JSONSerialization.data(withJSONObject: list, options: JSONSerialization.WritingOptions.prettyPrinted)
    let jsonList = String(data: dataSet, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))! as String
    
    if let data = jsonList.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: [])
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}
