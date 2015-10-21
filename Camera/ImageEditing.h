//
//  ImageEditing.h
//  Camera
//
//  Created by Mac Bellingrath on 10/21/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//
#import <UIKit/UIKit.h>



#ifndef ImageEditing_h
#define ImageEditing_h



static UIImage * resizeImage(UIImage * image, CGSize newSize) {
    
    //only works if new size is a square
    
    BOOL isPortrait = image.size.width < image.size.height;
    
    CGFloat scale = isPortrait ? newSize.width / image.size.width : newSize.width / image.size.height;
    
    CGFloat scaleHeight = isPortrait ? image.size.height * scale : newSize.width;
    CGFloat scaleWidth = isPortrait ? newSize.width : image.size.height * scale;
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(newSize.width - scaleWidth, newSize.width - scaleHeight, scaleWidth, scaleHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
    
}

static UIImage * flipImage(UIImage * image) {
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(ctx, -1.0, 1.0);
    
    [image drawInRect:CGRectMake(-image.size.width, 0, image.size.width, image.size.height)];
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
    
}

static UIImage * filterImage(UIImage * originalImage, NSString * filterName) {
    
CIContext *context = [CIContext contextWithOptions:nil];
CIImage *image =   [CIImage imageWithCGImage: originalImage.CGImage];
CIFilter *filter = [CIFilter filterWithName:filterName];
[filter setValue:image forKey:kCIInputImageKey];

//    [filter setValue:@0.8f forKey:kCIInputIntensityKey];
CIImage *filteredImage = [filter valueForKey:kCIOutputImageKey];              // 4
//CGRect extent = [filteredImage extent];
//CGImageRef cgImage = [context createCGImage:filteredImage fromRect:extent];   // 5


    return [UIImage imageWithCIImage:filteredImage];
    
}


#endif /* ImageEditing_h */

