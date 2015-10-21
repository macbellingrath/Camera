//
//  RegisterViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "RegisterViewController.h"

@import Parse;

@interface RegisterViewController ()<UITextFieldDelegate>

- (IBAction)nextButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    
    // do something here
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.usernameTextField) {
        [self.emailTextField becomeFirstResponder];
    } else if (textField == self.emailTextField) {
        [textField resignFirstResponder];
        [self.passwordTextField becomeFirstResponder];
        // here you can define what happens
        // when user presses return on the email field
    }   else {
        
        [self.view endEditing:YES];
    }
    return YES;
    }
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)nextButtonPressed:(UIButton *)sender {
    
    //check for text
    
    PFUser *user = [PFUser user];
    user.username = self.usernameTextField.text;
    user.password = self.passwordTextField.text;
    user.email = self.emailTextField.text;
    

    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {   // Hooray! Let them use the app now.
    
            
        } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
            NSLog(@"%@",errorString);
        }
    }];
    
}
@end
