//
//  SubmitViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "SubmitViewController.h"
#import <Parse/Parse.h>

@interface SubmitViewController ()

@property (weak, nonatomic) IBOutlet UITextView *captionTextView;
@end

@implementation SubmitViewController

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
- (IBAction)submitButtonPressed:(UIButton *)sender {
    
    PFObject * selfie = [PFObject objectWithClassName:@"Selfie"];
    selfie[@"caption"] = self.captionTextView.text;
   NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
    
    
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    selfie[@"imageFile"] = imageFile;
    [selfie saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            //do something
        } else {
            //Something bad happened, handle the error
            NSLog(@"%@", error);
        }
    }];
}

@end
