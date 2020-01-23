//
//  CustomSearchBar.swift
//  Sensyne
//
//  Created by Melwin Jose Kottayil on 1/21/20.
//  Copyright © 2020 TestEnvironment. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    var preferredFont: UIFont!
    var preferredTextColor: UIColor!
    
    override func draw(_ rect: CGRect) {
        if let index = indexOfSearchFieldInSubviews() {
            let searchField: UITextField = (subviews[0]).subviews[index] as! UITextField
            searchField.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
            searchField.font = preferredFont
            searchField.textColor = UIColor.black
            searchField.backgroundColor = barTintColor
        }
    }
    
    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        searchBarStyle = UISearchBar.Style.prominent
        isTranslucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0]
        return index
    }
}
