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
    
    func contrastColor()->UIColor
    {
        let color = self
        //from https://stackoverflow.com/a/1855903
        var d: Int = 0
        // Counting the perceptive luminance - human eye favors green color...
        let luminance:CGFloat = ( CGFloat(0.299) * color.redValue + CGFloat(0.587) * color.greenValue + CGFloat(0.114) * color.blueValue)
        if luminance > 0.3{
           d = 0; // bright colors - black background
        }else{
           d = 1; // dark colors - white background
        }
        return  UIColor(red: CGFloat(d),green: CGFloat(d),blue: CGFloat(d),alpha: CGFloat(1))
    }
}
