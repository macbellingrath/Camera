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
 
    self.filterCellIImageView.image = filterImage(self.originalImage, self.filterName);
    
}


@end

