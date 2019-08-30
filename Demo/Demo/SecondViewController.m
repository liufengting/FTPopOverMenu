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
@property (nonatomic, strong) NSArray<FTPopOverMenuModel *> *menuObjectArray;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

      self.navigationController.automaticallyAdjustsScrollViewInsets = YES;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(onNavButtonTapped:event:)]];
    

}

- (NSArray<FTPopOverMenuModel *> *)menuObjectArray {
    if (!_menuObjectArray) {
        _menuObjectArray = @[[[FTPopOverMenuModel alloc] initWithTitle:@"MenuOne" image:@"Pokemon_Go_01" selected:NO],
                             [[FTPopOverMenuModel alloc] initWithTitle:@"MenuTwo" image:@"Pokemon_Go_02" selected:NO],
                             [[FTPopOverMenuModel alloc] initWithTitle:@"MenuThree" image:@"Pokemon_Go_03" selected:YES],
                             [[FTPopOverMenuModel alloc] initWithTitle:@"MenuFour" image:@"Pokemon_Go_04" selected:NO]];
    }
    return _menuObjectArray;
}


-(void)onNavButtonTapped:(UIBarButtonItem *)sender event:(UIEvent *)event {

// provide two methods to deal with the barbuttonitems
// comment this fowowing line and see how the other way of dealing with barbuttonitems
    
//#define IfMethodOne

    
#ifdef IfMethodOne
    CGRect rect = [self.navigationController.navigationBar convertRect:[event.allTouches.anyObject view].frame toView:[[UIApplication sharedApplication] keyWindow]];
    [FTPopOverMenu showFromSenderFrame:rect
                         withMenuArray:@[@"MenuOne",@"MenuTwo",@"MenuThree",@"MenuFour"]
                            imageArray:@[@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04"]
                         configuration:[FTPopOverMenuConfiguration defaultConfiguration]
                             doneBlock:^(NSInteger selectedIndex) {
                                 NSLog(@"done");
                             } dismissBlock:^{
                                 NSLog(@"cancel");
                             }];
#else
    
    
    
    FTPopOverMenuConfiguration *config = [FTPopOverMenuConfiguration defaultConfiguration];
    config.backgroundColor = UIColor.redColor;
    config.coverBackgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    config.menuCornerRadius = 10.f;
    config.separatorInset = UIEdgeInsetsMake(0, 15.f, 0, 15.f);
    config.selectedCellBackgroundColor = [UIColor yellowColor];
//    config.imageSize = CGSizeMake(16.f, 16.f);
    [FTPopOverMenu showFromEvent:event
                   withMenuArray:self.menuObjectArray
                      imageArray:@[@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04"]
                   configuration:config
                       doneBlock:^(NSInteger selectedIndex) {
                           
                       }dismissBlock:^{
                           
                       }];

    

//    [FTPopOverMenu showFromEvent:event
//                   withMenuArray:@[@"MenuOne",@"MenuTwo",@"MenuThree",@"MenuFour"]
//                      imageArray:@[@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04"]
//                       doneBlock:^(NSInteger selectedIndex) {
//
//                       } dismissBlock:^{
//
//                       }];
    
#endif
    
    
}



#pragma mark - UITableViewDataSource,UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondTableViewCellIdentifier" forIndexPath:indexPath];
    
    [cell.buttonOne addTarget:self action:@selector(onButtonOneTapped:) forControlEvents:UIControlEventTouchUpInside];
    [cell.buttonTwo addTarget:self action:@selector(onButtonOneTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(void)onButtonOneTapped:(UIButton *)sender {
    
    NSArray *menuNameArray = @[@"MenuOne",@"MenuTwo",@"MenuThree",@"MenuFour",@"MenuOne",@"MenuTwo",@"MenuThree",@"MenuFour",@"MenuOne",@"MenuTwo",@"MenuThree",@"MenuFour"];
    NSArray *menuImageNameArray = @[@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04",@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04",@"Pokemon_Go_01",@"Pokemon_Go_02",@"Pokemon_Go_03",@"Pokemon_Go_04"];

    FTPopOverMenuConfiguration *config = [FTPopOverMenuConfiguration defaultConfiguration];
    config.borderColor = UIColor.whiteColor;
    [FTPopOverMenu showForSender:sender
                   withMenuArray:menuNameArray
                      imageArray:menuImageNameArray
                   configuration:config
                       doneBlock:^(NSInteger selectedIndex) {
                           
                           [sender setTitle:menuNameArray[selectedIndex] forState:UIControlStateNormal];
                           
                       } dismissBlock:^{
                           
                       }];

    
}

@end
