//
//  ViewController.m
//  FTPopOverMenu
//
//  Created by liufengting on 16/4/5.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "ViewController.h"
#import "FTPopOverMenu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)actionWithSender:(UIButton *)sender
{
    [FTPopOverMenu showForSender:sender
                        withMenu:@[@"MenuOne",@"MenuTwo",@"MenuThr"]
                  imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                           NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                           
                       } dismissBlock:^{
                           
                           NSLog(@"user canceled. do nothing.");
                           
                       }];
}

- (IBAction)actionOne:(id)sender {

    [self actionWithSender:sender];

}

- (IBAction)actionTwo:(id)sender {
    
    [self actionWithSender:sender];
    
}

- (IBAction)actionThr:(id)sender {
    
    [self actionWithSender:sender];

}

- (IBAction)actionFor:(id)sender {
    
    [self actionWithSender:sender];
    
}

- (IBAction)actionFiv:(id)sender {
    
    [self actionWithSender:sender];

}

- (IBAction)actionSix:(id)sender {
    
    [self actionWithSender:sender];
    

}


@end
