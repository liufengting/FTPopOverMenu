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
    
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(onNavButtonTapped:event:)]];
    

}


-(void)onNavButtonTapped:(UIBarButtonItem *)sender event:(UIEvent *)event
{

    // comment this fowowing line and see how the other way to implement nav items
    
//#define IfMethodOne

    
#ifdef IfMethodOne
    CGRect rect = [self.navigationController.navigationBar convertRect:[event.allTouches.anyObject view].frame toView:[[UIApplication sharedApplication] keyWindow]];
    
    
    [FTPopOverMenu showFromSenderFrame:rect
                              withMenu:@[@"123",@"234",@"345"]
                        imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                             doneBlock:^(NSInteger selectedIndex) {
                                 
                             } dismissBlock:^{
                                 
                             }];

    
#else
    
    [FTPopOverMenu setTintColor:[UIColor redColor]];
    
    [FTPopOverMenu showFromEvent:event
                        withMenu:@[@"123",@"234",@"345"]
                  imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                       } dismissBlock:^{
                           
                       }];
    
#endif
    
    
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

    /**
     The following method is another way of doing it, you can check out it at: https://github.com/liufengting/FTPopMenu
     */
    
//    FTPopTableViewController *pop = [[FTPopTableViewController alloc] init];
//    pop.sourceView = sender;
//    pop.titleString = @"Some";
//    pop.tintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2];
//    pop.menuStringArray = @[@"something important",@"something important",@"something important",@"something important",@"something important",@"something important",@"something important",@"something important",];
//    [self presentViewController:pop animated:YES completion:nil];
    
    
}




@end
