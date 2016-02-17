//
//  ViewController.m
//  SalSideDemo
//
//  Created by Mohanreddy on 16/02/16.
//  Copyright © 2016 Mohanreddy. All rights reserved.
//

#import "ViewController.h"
#import "DashBoardTableViewCell.h"
#import "DashBoardDetailViewController.h"

@interface ViewController ()

- (void) fetchDashBoardData;
- (void) clearViewController;
- (void) customInitialization;

@property (nonatomic, weak) IBOutlet UITableView *dashBoardTable;
@property (nonatomic, strong) NSMutableArray    *dashBoardData;
@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation ViewController

- (void) clearViewController
{
    self.dashBoardTable = nil;
    self.dashBoardData  = nil;
    self.hud            = nil;
}

- (void) customInitialization
{
    _dashBoardData = [[NSMutableArray alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customInitialization];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.topItem.title = @"DashBoard Items";

}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self fetchDashBoardData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) dealloc
{
    [self clearViewController];
}


- (void) fetchDashBoardData
{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.detailsLabelText = @"Fetching ..";

    NetWorkManager *webObject = [NetWorkManager sharedManager];
    [webObject getDashBoardItems:^(id responseObject, id error) {
        DB_LOG(@"Response == %@", responseObject);
        
        if ([error isEqualToString:@"Successfully"])
        {
            for (NSMutableDictionary *infoDict in responseObject)
            {
                DashBoardModel *info = [ DashBoardModel dashBoardDetailsFinderFromDictionary:infoDict];
                [_dashBoardData addObject:info];
            }
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.dashBoardTable reloadData];
        }
        else
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];

            UIAlertView *alert = [[UIAlertView alloc]   initWithTitle:@"Warning"
                                                            message: error
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        
    }];
}

#pragma mark - tableview Delegates

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return [_dashBoardData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"DashBoardItemCell";
    DashBoardTableViewCell *dashBoardCell = nil;
    
    dashBoardCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (dashBoardCell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"DashBoardTableViewCell" owner:self options:nil];
        dashBoardCell = array[0];
    }
    
    DashBoardModel *dashBoardItem   = [_dashBoardData objectAtIndex:indexPath.row];
    dashBoardCell.profileTitle.text = [NSString stringWithFormat:@"Title: %@", dashBoardItem.titleName];
    dashBoardCell.profileDesc.text  = [NSString stringWithFormat:@"Description: %@", dashBoardItem.desc];
    
    return dashBoardCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DashBoardDetailViewController *detailVC = [[DashBoardDetailViewController alloc] initWithNibName:@"DashBoardDetailViewController" bundle:nil];
    detailVC.selectedModel = [_dashBoardData objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
