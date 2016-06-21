//
//  FTPopTableViewController.h
//  FTPopMenu
//
//  Created by liufengting on 16/5/30.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTPopTableViewController : UITableViewController

@property (nonatomic, assign)UIBarButtonItem *barButtonItem;
@property (nonatomic, assign)UIView *sourceView;
@property (nonatomic, assign)CGFloat perferdWidth;
@property (nonatomic, assign)CGFloat rowHeight;
@property (nonatomic, strong)UIColor* tintColor;
@property (nonatomic, strong)UIColor* textColor;
@property (nonatomic, strong)NSString* titleString;
@property (nonatomic, strong)NSArray<NSString *>* menuStringArray;
@property (nonatomic, strong)NSArray<NSString *>* menuImageNameArray;

@end
