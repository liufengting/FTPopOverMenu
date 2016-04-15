//
//  DemoTests.m
//  DemoTests
//
//  Created by liufengting on 16/4/15.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FTPopOverMenu.h"

@interface DemoTests : XCTestCase

@end

@implementation DemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.

    // Put the code you want to measure the time of here.
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
