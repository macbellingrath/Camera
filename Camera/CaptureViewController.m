//
//  CaptureViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "CaptureViewController.h"
#import "FilterViewController.h"
#import "ImageEditing.h"

@import AVFoundation;

@interface CaptureViewController () <AVCaptureFileOutputRecordingDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (IBAction)captureButtonPressed:(UIButton *)sender;
- (IBAction)useButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *useButton;
@property (weak, nonatomic) IBOutlet UIView *previewView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property UIImagePickerController * picker;
@property (strong, nonatomic) AVCaptureStillImageOutput * snapper;
@property (strong, nonatomic) AVCaptureSession * session;
@property (strong, nonatomic) UIImage *imageToUse;

@end

@implementation CaptureViewController

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect newFrame = self.picker.view.frame;
    
    newFrame.size.width = self.picker.view.frame.size.height / 4 * 3;
    
    newFrame.origin.x = (self.previewView.frame.size.width - newFrame.size.width) / 2;
    
    self.picker.view.frame = newFrame;
}
- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self.view setNeedsLayout];
    
    
#pragma mark - Picker
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.picker.delegate = self;
    self.picker.showsCameraControls = NO;
    self.picker.cameraDevice =UIImagePickerControllerCameraDeviceFront;

    [self.previewView addSubview:self.picker.view];
    
    
    
  

   
    [[self useButton] setHidden:true];
    [[self cancelButton] setHidden:true];
    
    // Do any additional setup after loading the view.
    
//    //Capture Session
//    self.session = [[AVCaptureSession alloc]init];
//    self.session.sessionPreset = AVCaptureSessionPresetPhoto;
//    
//    //Add device
//    AVCaptureDevice *device =
//    [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//    
//    //Input
//    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
//    
//    if (!input)
//    {
//        NSLog(@"No Input");
//    }
//    
//    [self.session addInput:input];
//    
//    //Output
//    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
//    [self.session addOutput:output];
//    output.videoSettings =
//    @{ (NSString *)kCVPixelBufferPixelFormatTypeKey : @(kCVPixelFormatType_32BGRA) };
//    
//    //Preview Layer
//    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
//   
//    previewLayer.frame = self.view.bounds;
//    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
//    [self.previewView.layer addSublayer:previewLayer];
//    
//    //Output
//    self.snapper = [[AVCaptureStillImageOutput alloc] init];
//    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
//    [self.snapper setOutputSettings:outputSettings];
//    
//    [self.session addOutput:self.snapper];
//
//    
//    //Start capture session
//    [self.session startRunning];
//  
}

-(void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)captureButtonPressed:(UIButton *)sender {
    
    [self.picker takePicture];
    
//    [[self useButton] setHidden:false];
//    [[self useButton] setHidden:false];
//    AVCaptureConnection *videoConnection = nil;
//    for (AVCaptureConnection *connection in self.snapper.connections) {
//        for (AVCaptureInputPort *port in [connection inputPorts]) {
//            if ([[port mediaType] isEqual:AVMediaTypeVideo] ) {
//                videoConnection = connection;
//                break;
//            }
//        }
//        if (videoConnection) { break; }
//    }
//    
//    NSLog(@"about to request a capture from: %@", self.snapper);
////    __weak typeof(self) weakSelf = self;
//    [self.snapper captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler: ^(CMSampleBufferRef imageSampleBuffer, NSError *error) {
//        
//        NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
//       
//        UIImage *image = [[UIImage alloc] initWithData:imageData];
//        self.imageToUse = image;
//        
//        NSLog(@"successfully captured image");
//        
//        
//        [self.session stopRunning];
//    
//    }];
}


#pragma mark - Image Picker

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    FilterViewController *filterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FilterVC"];

  
    filterVC.originalImage = flipImage(image);
    [self.navigationController pushViewController:filterVC animated:YES];
}


 #pragma mark - Navigation
 

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
//     FilterViewController *destination = [segue destinationViewController];
//     destination = [[FilterViewController alloc] init];
//     destination.imageView.image = self.imageToUse;
     
 // Pass the selected object to the new view controller.
 }

- (IBAction)useButtonPressed:(UIButton *)sender {

    

}
@end
