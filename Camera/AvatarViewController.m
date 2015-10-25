//
//  AvatarViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "AvatarViewController.h"
#import "Parse/Parse.h"
@interface AvatarViewController ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
- (IBAction)doneButtonPressed:(id)sender;

- (IBAction)changePhotoButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *setPhotoButton;
@property(nonatomic) UIImagePickerController *picker;

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
    PFUser *currentUser = [PFUser currentUser];
    
    NSData *imageData =  UIImagePNGRepresentation(self.avatarImageView);
    
    PFFile *imageFile = [PFFile fileWithData:imageData];
    
    
    
    [currentUser setObject:imageFile forKey:@"avatarImage"];
    
    
    
    [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            //do something
        } else {
            //Something bad happened, handle the error
            NSLog(@"%@", error);
        }
    }];

}

- (IBAction)changePhotoButtonPressed:(id)sender {
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.picker.delegate = self;
    self.picker.showsCameraControls = YES;
    self.picker.cameraDevice =UIImagePickerControllerCameraDeviceFront;
    
    [self.navigationController presentViewController:self.picker animated:YES completion:
        nil];
     

}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.avatarImageView.image = image;
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    
    
   
    

}
@end
