//
//  Service.swift
//  Sensyne
//
//  Created by Melwin Jose Kottayil on 1/22/20.
//  Copyright © 2020 TestEnvironment. All rights reserved.
//

import Foundation
import SwiftCSV

class Service: NSObject {
    static let shared = Service()
    var hospitalListDictionary : [[String:String]] = []
    
    func fetchDataFromFile()->[[String:String]] {
        do {
            let resource: CSV? = try CSV(
            name: "Hospital",
            extension: "csv",
            bundle: .main,
            delimiter: "\t",
            encoding: .ascii)

            try resource!.enumerateAsDict { dict in
                self.hospitalListDictionary.append(dict)
            }
        } catch {
            print(error)
        }
        return self.hospitalListDictionary
    }
}
