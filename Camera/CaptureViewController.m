//
//  CaptureViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "CaptureViewController.h"
@import AVFoundation;

@interface CaptureViewController () <AVCaptureVideoDataOutputSampleBufferDelegate>

@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) dispatch_queue_t sampleQueue;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) UIImage *capturedImage;
@property (nonatomic, strong) AVCaptureStillImageOutput *snap;
@property (weak, nonatomic) IBOutlet UIView *previewViewLayer;
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection;
- (IBAction)captureButtonPressed:(UIButton *)sender;

@end

@implementation CaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.session = [[AVCaptureSession alloc] init];
    
    AVCaptureDevice *device = [self frontCamera];
    
    if (!device) {
        NSLog(@"Couldn't get a camera.");
        return;
    }
    
    NSError *error;
    AVCaptureDeviceInput *input = [[AVCaptureDeviceInput alloc] initWithDevice:device
                                                                         error:&error];
    
    if (input) {
        [self.session addInput:input];
        
        AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
        //        [output setVideoSettings:@{ (id)kCVPixelBufferPixelFormatTypeKey: @(kCMPixelFormat_32BGRA)}];
        self.sampleQueue = dispatch_queue_create("VideoSampleQueue", DISPATCH_QUEUE_SERIAL);
        
        [output setSampleBufferDelegate:self queue:self.sampleQueue];
        [self.session addOutput:output];
        
        self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
        self.previewLayer.frame = self.view.layer.bounds;
        self.view.layer.masksToBounds = YES;
        self.view.layer.backgroundColor = [[UIColor blackColor] CGColor];
        [self.view.layer addSublayer:self.previewLayer];
        
        [self.session startRunning];
    } else {
        NSLog(@"Couldn't initialize device input: %@", error);
    }
    
}

- (AVCaptureDevice *)frontCamera {
    for (AVCaptureDevice *device in [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo]) {
        if ([device position] == AVCaptureDevicePositionFront) {
            return device;
        }
    }
    
    return [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection {
    
        CVImageBufferRef cvImage = CMSampleBufferGetImageBuffer(sampleBuffer);
        CIImage *ciImage = [CIImage imageWithCVPixelBuffer:cvImage];
//        ciImage = [ciImage imageByApplyingTransform:(CGAffineTransform)]
        self.capturedImage = [UIImage imageWithCIImage:ciImage];
    
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput
  didDropSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection {
    
}


//Capture Still Image Output
-(IBAction)captureButtonPressed:(UIButton *)sender {
    NSLog(@"Button Pressed");
    self.snap = [[AVCaptureStillImageOutput alloc] init];
    
}

//nav

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

}

@end
