//
//  SecondViewController.m
//  FTPopOverMenu
//
//  Created by liufengting on 16/4/12.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondTableViewCell.h"
#import "FTPopOverMenu.h"

@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(onNavButtonTapped:)]];
    

}

-(void)onNavButtonTapped:(UIBarButtonItem *)sender{
    
    [FTPopOverMenu showFromSenderFrame:CGRectMake(self.view.frame.size.width - 40, 20, 40, 40)
                              withMenu:@[@"123",@"234",@"345"]
                        imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                             doneBlock:^(NSInteger selectedIndex) {
                                 
                             } dismissBlock:^{
                                 
                             }];
}


#pragma mark - UITableViewDataSource,UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondTableViewCellIdentifier" forIndexPath:indexPath];
    
    [cell.buttonOne addTarget:self action:@selector(onButtonOneTapped:) forControlEvents:UIControlEventTouchUpInside];
    [cell.buttonTwo addTarget:self action:@selector(onButtonOneTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}


-(void)onButtonOneTapped:(UIButton *)sender
{
    [FTPopOverMenu showForSender:sender
                        withMenu:@[@"123",@"234",@"345"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                       } dismissBlock:^{
                           
                       }];
}




@end
