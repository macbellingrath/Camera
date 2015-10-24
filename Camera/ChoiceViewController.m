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

-(void)viewDidLoad{
    [super viewDidLoad];
    // Create image
    UIImage *image = [UIImage imageNamed: @"logo_green"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage: image];
    
    // set the text view to the image view
    self.navigationItem.titleView = imageview;

}

- (IBAction)loginButtonPressed:(UIButton *)sender {
    
}
- (IBAction)loginWithTwitterButtonPressed:(id)sender {
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Twitter login.");
            return;
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in with Twitter!");
            
            
            UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UINavigationController *nc = [main instantiateInitialViewController];
            
            [[self navigationController] presentViewController:nc animated:true completion:nil];
           
         
            
            
        } else {
            NSLog(@"User logged in with Twitter!");
            
            UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UINavigationController *nc = [main instantiateInitialViewController];
            
            [[self navigationController] presentViewController:nc animated:true completion:nil];
          
        }
    }];
}
@end
