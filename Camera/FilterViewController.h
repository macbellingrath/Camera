//
//  FilterViewController.h
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FilterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;


@property UIImage * originalImage;
@property NSString *filterName;



@end
