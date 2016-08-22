//
//  DemoTests.m
//  DemoTests
//
//  Created by liufengting on 16/4/15.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FTPopOverMenu.h"

@interface DemoTests : XCTestCase

@end

@implementation DemoTests

- (void)testExample {
    // This is an example of a performance test case.
    
    [FTPopOverMenu showForSender:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)]
                        withMenu:@[@"MenuOne",@"MenuTwo",@"MenuThr"]
                  imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                           NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                           
                       } dismissBlock:^{
                           
                           NSLog(@"user canceled. do nothing.");
                           
                       }];
    
}

@end
