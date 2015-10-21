//
//  FilterCollectionViewCell.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "FilterCollectionViewCell.h"
#import "ImageEditing.h"

@implementation FilterCollectionViewCell

-(void)didMoveToWindow {
    
    self.filterCellIImageView.image = filterImage(self.originalImage, self.filterName);
    
}
-(void)prepareForReuse {
    self.filterCellIImageView.image = nil;
    self.filterCellIImageView.image = filterImage(self.originalImage, self.filterName);
    
}
-(void)runFilterInBackground {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        UIImage * filteredImage = filterImage(self.originalImage, self.filterName);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.filterCellIImageView.image = filteredImage;
            });
    });
}


@end

