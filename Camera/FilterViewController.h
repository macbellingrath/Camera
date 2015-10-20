//
//  FilterViewController.h
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController

@property UIImage * originalImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property UIImage *editedImage;

@end
