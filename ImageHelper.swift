//
//  ImageHelper.swift
//
//  Created by Sven Bautz on 18.06.15.
//  Copyright (c) Sven Bautz
//

import Foundation


class ImageHelper {

    /**
    returns UIImage with expected height
    **/
    class func resizeImage(image: UIImage, newHeight: CGFloat) -> UIImage {
        let scale = newHeight / image.size.height
        let newWidth = image.size.width * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    /**
    returns UImage with expected width
    **/
    class func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    class func resizeImage(image: UIImage, longestSide: CGFloat) -> UIImage {
        if image.size.height > image.size.width {
            return resizeImage(image, newHeight: longestSide)
        } else {
            return resizeImage(image, newWidth: longestSide)
        }
    }
    
    /**
    returns an base64 encoded string from UIImage
    **/
    class func base64FromImage(image: UIImage, quality: CGFloat) -> String {
        var imageBase64 = ""
        if let imageData = UIImageJPEGRepresentation(image,quality){
            imageBase64 = imageData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.allZeros)
        }
        return imageBase64
    }
    
    
    /**
    returns UIImage from a base64 encoded string
    **/
    class func imageFromBase64(base64: String) -> UIImage? {
        var image : UIImage? = nil
        if let imageData = NSData(base64EncodedString: base64, options:NSDataBase64DecodingOptions.allZeros) {
            image = UIImage(data: imageData)
        }
        return image
    }
}