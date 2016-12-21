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

- (IBAction)showMenuFromButton:(UIButton *)sender
{
    
    // Do any of the following setting to set the style (Only set what you want to change)
    // Maybe do this when app starts (in AppDelegate) or anywhere you wanna change the style.

    
    // uncomment the following line to use custom settings.
    
//#define USE_CUSTOM_SETTINGS

#ifdef USE_CUSTOM_SETTINGS
    FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
    configuration.menuRowHeight = 80;
    configuration.menuWidth = 120;
    configuration.textColor = [UIColor orangeColor];
    configuration.textFont = [UIFont boldSystemFontOfSize:14];
    configuration.tintColor = [UIColor whiteColor];
    configuration.borderColor = [UIColor blackColor];
    configuration.borderWidth = 0.5;
//    configuration.textAlignment = NSTextAlignmentCenter;
//    configuration.ignoreImageOriginalColor = YES;// set 'ignoreImageOriginalColor' to YES, images color will be same as textColor

#endif
    
    
    
    // supports image name, UIImage, image remote URL (NSURL), image remote URL string
    
    NSString *icomImageURLString = @"https://avatars1.githubusercontent.com/u/4414522?v=3&s=40";
    
    NSURL *icomImageURL = [NSURL URLWithString:icomImageURLString];

    [FTPopOverMenu showForSender:sender
                   withMenuArray:@[@"MenuOne", @"MenuTwo", @"MenuThree", @"MenuFour",]
                      imageArray:@[icomImageURLString, icomImageURL, [UIImage imageNamed:@"Pokemon_Go_03"], @"Pokemon_Go_04"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                           NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                           
                       } dismissBlock:^{
                           
                           NSLog(@"user canceled. do nothing.");
                           
                       }];
    
    
    
}



@end
