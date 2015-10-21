//
//  FilterViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterCollectionViewCell.h"
#import "ImageEditing.h"



@interface FilterViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;


@end

@implementation FilterViewController {
    
    NSArray * filterNames;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.originalImage;
    
    self.filterCollectionView.delegate = self;
    self.filterCollectionView.dataSource = self;
    
    filterNames = [CIFilter filterNamesInCategory: kCICategoryColorEffect];
    
    [self.filterCollectionView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark: Collection View

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return filterNames.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FilterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
        cell.filterName = filterNames[indexPath.item];

    UIImage * resizedImage = resizeImage(self.originalImage, cell.contentView.frame.size);
        cell.originalImage = resizedImage;
    
      return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    FilterCollectionViewCell * cell = (FilterCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        UIImage * filteredImage = filterImage(self.originalImage, self.filterName);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.filterImageView.image = filteredImage;
        });
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
