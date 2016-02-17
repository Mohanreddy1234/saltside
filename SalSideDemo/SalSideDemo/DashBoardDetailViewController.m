//
//  DashBoardDetailViewController.m
//  SalSideDemo
//
//  Created by Mohanreddy on 17/02/16.
//  Copyright © 2016 Mohanreddy. All rights reserved.
//

#import "DashBoardDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DashBoardDetailViewController ()

@property (nonatomic, weak) IBOutlet UIImageView    *profileImg;
@property (nonatomic, weak) IBOutlet UILabel        *profileTile;
@property (nonatomic, weak) IBOutlet UILabel        *profileDesc;

@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation DashBoardDetailViewController
@synthesize selectedModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @" ";
    self.navigationController.title = @"DashBoard Detail";

}

- (void) viewDidAppear:(BOOL)animated
{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.detailsLabelText = @"Fetching Detail..";
    
    // Here we use the new provided sd_setImageWithURL: method to load the web image
    [_profileImg sd_setImageWithURL:[NSURL URLWithString:selectedModel.imageUrl]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                 _profileTile.text = selectedModel.titleName;
                                 _profileDesc.text = selectedModel.desc;
                                 [MBProgressHUD hideHUDForView:self.view animated:YES];

                             }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
