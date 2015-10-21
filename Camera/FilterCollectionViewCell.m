//
//  FilterCollectionViewCell.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "FilterCollectionViewCell.h"

@implementation FilterCollectionViewCell

-(void)didMoveToWindow {
    [self filterImage];
}
-(void)prepareForReuse {
    [self filterImage];
    
}

-(void)filterImage {
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image =   [CIImage imageWithCGImage:self.originalImage.CGImage];
    CIFilter *filter = [CIFilter filterWithName:self.filterName];
    [filter setValue:image forKey:kCIInputImageKey];
    
//    [filter setValue:@0.8f forKey:kCIInputIntensityKey];
        CIImage *filteredImage = [filter valueForKey:kCIOutputImageKey];              // 4
    CGRect extent = [filteredImage extent];
    CGImageRef cgImage = [context createCGImage:filteredImage fromRect:extent];   // 5
    
    //Fix rotation of CIImage
    UIImageOrientation originalOrientation = self.originalImage.imageOrientation;
    CGFloat originalScale = self.originalImage.scale;
    
    UIImage *newPtImage = [UIImage imageWithCGImage:cgImage scale:originalScale orientation:originalOrientation];

    
    
    self.filterCellIImageView.image = newPtImage;
    
}

@end

