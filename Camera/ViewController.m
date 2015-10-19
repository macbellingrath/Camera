//
//  ViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property UIImagePickerController * pickerController;
@property (weak, nonatomic) IBOutlet UIImageView *mySelfieImageView;
- (IBAction)takePhotoButtonPressed:(UIButton *)sender;

-(void)presentPicker;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self != nil) {
        
       
        
  
    }
    
    return self;
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.mySelfieImageView.image == nil) {
        [self presentPicker];
    }
    self.mySelfieImageView.contentMode = UIViewContentModeScaleAspectFit;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    self.mySelfieImageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    //Add pickercontroller's view to superview
//    [self.view addSubview:self.pickerController.view];
    


}
-(void)presentPicker{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        
        //allocate and initialize our UIImagePickerController
        self.pickerController = [[UIImagePickerController alloc] init];
        
        //Set source type to camera
        self.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.pickerController.cameraCaptureMode = UIImagePickerControllerCameraDeviceFront;
        self.pickerController.delegate = self;
        
    } else {
        
        //allocate and initialize our UIImagePickerController
        self.pickerController = [[UIImagePickerController alloc] init];
        self.pickerController.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        self.pickerController.delegate = self;
        [self presentViewController: self.pickerController animated:true completion:nil];
    }
}


- (IBAction)takePhotoButtonPressed:(UIButton *)sender {
    [self presentPicker];
    
}
@end
