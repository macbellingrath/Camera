//
//  ChoiceViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "ChoiceViewController.h"
#import "Twitter/Twitter.h"
#import <ParseTwitterUtils/PFTwitterUtils.h>
#import <ParseTwitterUtils/PF_Twitter.h>


@interface ChoiceViewController ()
- (IBAction)loginButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *registerButtonPressed;
- (IBAction)loginWithTwitterButtonPressed:(id)sender;

@end

@implementation ChoiceViewController




- (IBAction)loginButtonPressed:(UIButton *)sender {
    
}
- (IBAction)loginWithTwitterButtonPressed:(id)sender {
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Twitter login.");
            return;
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in with Twitter!");
            
            UINavigationController * nc;
                
            UIStoryboard * mainstoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            nc = [mainstoryboard instantiateInitialViewController];

            
            
        } else {
            NSLog(@"User logged in with Twitter!");
        }
    }];
}
@end
