//
//  UIColor+getComponents.swift
//  ProjectDim
//
//  Created by  on 10/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
    
    func contrastColor()->UIColor{//get ideal background color of text
        //modified version of https://stackoverflow.com/a/1855903
        var d: CGFloat = 0
        // Calculate relative luminance - human eye favors green color...
        let luminance:CGFloat = ( CGFloat(0.2126) * self.redValue + CGFloat(0.7152) * self.greenValue + CGFloat(0.0722) * self.blueValue)
        if luminance > 0.5{
            d = 0.1; // bright colors - dark background
        }else{
            d = 1; // dark colors - white background
        }
        return  UIColor(red: d,green: d,blue: d,alpha: CGFloat(1))
    }
}
