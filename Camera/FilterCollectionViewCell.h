//
//  FilterCollectionViewCell.h
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FilterCollectionViewCell : UICollectionViewCell

@property NSString * filterName;
@property UIImage * originalImage;
@property (weak, nonatomic) IBOutlet UIImageView *filterCellIImageView;

@end
