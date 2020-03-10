//
//  UIImage+Color.swift
//  ProjectDim
//
//  Created by  on 09/03/2020.
//  Copyright © 2020 Yannick VERON. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    //modified version of : https://www.hackingwithswift.com/example-code/media/how-to-read-the-average-color-of-a-uiimage-using-ciareaaverage
    func averageColor(areaSize: Float=0)->UIColor?{//return average color of an area of the image : if area < 1 => get average color of area left + area right
        guard let inputImage = CIImage(image: self) else { return nil }
        let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
        var colors:[UInt8]=[]
        let bitmapColor = {(areaSize:Float, isRight:Bool)->[UInt8]? in
            var x = inputImage.extent.origin.x
            var z = inputImage.extent.size.width*CGFloat(areaSize)
            if isRight{//if right side
                x+=inputImage.extent.size.width-z
                z=inputImage.extent.size.width
            }
            var colorBitmap = [UInt8](repeating: 0, count: 4)//create color bitmap
            let extentVector = CIVector(x: x, y: inputImage.extent.origin.y, z: z, w: inputImage.extent.size.height)//set roi
            guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
            guard let outputImage = filter.outputImage else { return nil }
            context.render(outputImage, toBitmap: &colorBitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
            return colorBitmap
        }

        if let bitmap = bitmapColor(areaSize,false){//get left side color average
            colors=bitmap
        }
        if areaSize != 1{//if not whole image get right side color average
            var colorsRight:[UInt8]=[]
            if let bitmap = bitmapColor(areaSize, true){
                colorsRight=bitmap
            }
            for i in 0...2{//get average of left and right side
                let avg:Int = Int((Int(colors[i])+Int(colorsRight[i]))/2)
                colors[i]=UInt8(avg)
            }
        }
        return UIColor(red: CGFloat(colors[0]) / 255, green: CGFloat(colors[1]) / 255, blue: CGFloat(colors[2]) / 255, alpha: CGFloat(1))//convert 0..255 range to 0..1
    }
}
