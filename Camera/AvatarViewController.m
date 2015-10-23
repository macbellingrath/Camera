//
//  AvatarViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "AvatarViewController.h"

@interface AvatarViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
- (IBAction)doneButtonPressed:(id)sender;

- (IBAction)changePhotoButtonPressed:(id)sender;

@end

@implementation AvatarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneButtonPressed:(id)sender {
}

- (IBAction)changePhotoButtonPressed:(id)sender {
}
@end
