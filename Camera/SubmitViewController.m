//
//  SubmitViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "SubmitViewController.h"

@interface SubmitViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)submitButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

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
}
@end
