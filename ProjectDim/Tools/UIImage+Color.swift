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
    //source : https://www.hackingwithswift.com/example-code/media/how-to-read-the-average-color-of-a-uiimage-using-ciareaaverage
    /*var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }*/
    
    func averageColor(areaSize: Float=0)->UIColor?{
        guard let inputImage = CIImage(image: self) else { return nil }
        
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        var colors:[UInt8]
        
        
        var bitmap = {(areaSize:Float, isRight:Bool)->[UInt8]? in
            var y = inputImage.extent.origin.y
            if isRight{
                y+=inputImage.extent.size.width/CGFloat(1-areaSize)
            }
            
            let extentVector: CIVector
            var colorBitmap = [UInt8](repeating: 0, count: 4)
            extentVector = CIVector(x: inputImage.extent.origin.x, y: y, z: inputImage.extent.size.width/CGFloat(areaSize), w: inputImage.extent.size.height)
            guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
            guard let outputImage = filter.outputImage else { return nil }
            context.render(outputImage, toBitmap: &colorBitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
            return colorBitmap
        }

        if let bitmap = bitmap(areaSize,false){
            colors=bitmap
        }
        if areaSize != 1{
            var colors2:[UInt8]
            if let bitmap = bitmap(areaSize, false){
                colors2=bitmap
            }
            for i in 0...3{
                print(i)
                let avg:Int = Int((Int(colors[i])+Int(colors2[i]))/2)
                colors[i]=UInt8(avg)
            }
        }

        return UIColor(red: CGFloat(colors[0]) / 255, green: CGFloat(colors[1]) / 255, blue: CGFloat(colors[2]) / 255, alpha: CGFloat(colors[3]) / 255)
    }
}
