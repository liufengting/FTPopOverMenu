//
//  SecondViewController.m
//  FTPopOverMenu
//
//  Created by liufengting on 16/4/12.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
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

      self.navigationController.automaticallyAdjustsScrollViewInsets = YES;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(onNavButtonTapped:event:)]];
    

}


-(void)onNavButtonTapped:(UIBarButtonItem *)sender event:(UIEvent *)event
{

// provide two methods to deal with the barbuttonitems
// comment this fowowing line and see how the other way of dealing with barbuttonitems
    
//#define IfMethodOne

    
#ifdef IfMethodOne
    CGRect rect = [self.navigationController.navigationBar convertRect:[event.allTouches.anyObject view].frame toView:[[UIApplication sharedApplication] keyWindow]];
    
    [FTPopOverMenu showFromSenderFrame:rect
                              withMenu:@[@"MenuOne",@"MenuTwo",@"MenuThree",@"MenuFour"]
                        imageNameArray:@[@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04"]
                             doneBlock:^(NSInteger selectedIndex) {
                                 NSLog(@"done");
                             } dismissBlock:^{
                                 NSLog(@"cancel");
                             }];

    
#else

    [FTPopOverMenu showFromEvent:event
                        withMenu:@[@"MenuOne",@"MenuTwo",@"MenuThree",@"MenuFour"]
                  imageNameArray:@[@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04"]
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(void)onButtonOneTapped:(UIButton *)sender
{
    
    [FTPopOverMenu showForSender:sender
                        withMenu:@[@"MenuOne",@"MenuTwo",@"MenuThree",@"MenuFour",@"MenuOne",@"MenuTwo",@"MenuThree",@"MenuFour",@"MenuOne",@"MenuTwo",@"MenuThree",@"MenuFour"]
                  imageNameArray:@[@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04",@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04",@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                       } dismissBlock:^{
                           
                       }];

    
}




@end
