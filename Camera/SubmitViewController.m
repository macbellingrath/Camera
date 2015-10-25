//
//  SubmitViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "SubmitViewController.h"
#import <Parse/Parse.h>

@interface SubmitViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *filteredImageView;
@property (weak, nonatomic) IBOutlet UITextView *captionTextView;
@end

@implementation SubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.filteredImageView.image = self.filteredImage;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.captionTextView resignFirstResponder];
    return YES;
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
    
    NSData *imageData =  UIImagePNGRepresentation(self.filteredImage);
    
    PFFile *imageFile = [PFFile fileWithData:imageData];
    
    
    
    selfie[@"image"] = imageFile; //pffile column
    selfie[@"caption"] = self.captionTextView.text; //string column
    selfie[@"user"] = [PFUser currentUser]; //pointer -> _User column
    

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
