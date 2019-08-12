//
//  ViewController.m
//  FTPopOverMenu
//
//  Created by liufengting on 16/4/5.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "ViewController.h"
#import "FTPopOverMenu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)showMenuFromButton:(UIButton *)sender {
    
    // Do any of the following setting to set the style (Only set what you want to change)

    //    FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
    //    configuration.menuRowHeight = 80;
    //    configuration.menuWidth = 120;
    //    configuration.textColor = [UIColor orangeColor];
    //    configuration.textFont = [UIFont boldSystemFontOfSize:14];
    //    configuration.tintColor = [UIColor whiteColor];
    //    configuration.borderColor = [UIColor blackColor];
    //    configuration.borderWidth = 0.5;
    //    configuration.textAlignment = NSTextAlignmentCenter;
    //    configuration.ignoreImageOriginalColor = YES;// set 'ignoreImageOriginalColor' to YES, images color will be same as textColor

    
//        menuArray supports following context:
//        1. image name (NSString, only main bundle),
//        2. image (UIImage),
//        3. image remote URL string (NSString),
//        4. image remote URL (NSURL),
//        5. model (FTPopOverMenuModel, select state support)

    NSString *icomImageURLString = @"https://avatars1.githubusercontent.com/u/4414522?v=3&s=40";
    NSURL *icomImageURL = [NSURL URLWithString:icomImageURLString];

    [FTPopOverMenu showForSender:sender
                   withMenuArray:@[@"MenuOne", @"MenuTwo", @"MenuThree", @"MenuFour",]
                      imageArray:@[icomImageURLString, icomImageURL, [UIImage imageNamed:@"Pokemon_Go_03"], @"Pokemon_Go_04"]
//                   configuration:configuration
                       doneBlock:^(NSInteger selectedIndex) {
                           
                           NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                           
                       } dismissBlock:^{
                           
                           NSLog(@"user canceled. do nothing.");
                           
//                           FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
//                           configuration.allowRoundedArrow = !configuration.allowRoundedArrow;
                           
                       }];
    
    
    
}

@end
