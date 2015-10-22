//
//  SelfieTableViewController.m
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "SelfieTableViewController.h"
#import "SelfieTableViewCell.h"
#import "Parse/Parse.h"


@interface SelfieTableViewController ()
-(void)logout;

@end

@implementation SelfieTableViewController {
    NSMutableArray *selfies;

}


-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    NSLog(@"View did load");
    
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"logout" style:UIBarButtonItemStylePlain target:self action: @selector(logout)];
    [self navigationItem].leftBarButtonItem = logoutButton;
    selfies = [@[] mutableCopy];
    
    PFQuery * selfieQuery = [PFQuery queryWithClassName:@"Selfie"];
    
    [selfieQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        for (PFObject *selfie in objects) {
           
            
            [selfies addObject: selfie];
            
        }
        
        NSLog(@"Query Completed");
       [self.tableView reloadData];
        
    }];
    
    NSLog(@"%@", selfies);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    NSLog(@"Current selfie count %d", (int)selfies.count);
    return selfies.count;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    SelfieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.selfie = selfies[indexPath.row];
    return cell;
}
     
-(void)logout{
    [PFUser logOut];
   
    UIStoryboard *userSB = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    UINavigationController * nc = [userSB instantiateInitialViewController];
    
    [UIApplication sharedApplication].windows[0].rootViewController = nc;


    
}
@end
