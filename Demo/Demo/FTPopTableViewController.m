//
//  FTPopTableViewController.m
//  FTPopMenu
//
//  Created by liufengting on 16/5/30.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "FTPopTableViewController.h"

@interface FTPopTableViewController () <UIPopoverPresentationControllerDelegate,UIAdaptivePresentationControllerDelegate>

@end

@implementation FTPopTableViewController

-(instancetype)init
{
    self = [self initWithStyle:UITableViewStyleGrouped];
    return self;
}
-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self setUp];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
}

-(void)setUp
{
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.modalPresentationStyle = UIModalPresentationPopover;
    self.popoverPresentationController.delegate = self;

    self.tableView.backgroundColor = [UIColor clearColor];

//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) style:UITableViewStyleGrouped];
//        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
//        [self.view addSubview:_tableView];
//    }
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
}






-(CGFloat)rowHeight
{
    if (_rowHeight <= 0) {
        _rowHeight = 44.f;
    }
    return _rowHeight;
}
-(UIColor *)tintColor
{
    if (!_tintColor) {
        _tintColor = [UIColor whiteColor];
    }
    return _tintColor;
}

-(UIColor *)textColor
{
    if (!_textColor) {
        _textColor = [UIColor blackColor];
    }
    return _textColor;
}
-(CGFloat)perferdWidth
{
    if (_perferdWidth <= 0) {
        _perferdWidth = 200.f;
    }
    return _perferdWidth;
}

-(CGFloat)tableviewHeaderViewHeight
{
    if (_titleString.length) {
        return 30.f;
    }
    return 0.f;
}

-(CGFloat)contentHeight
{
    return self.tableviewHeaderViewHeight + (self.menuStringArray.count)*self.rowHeight;
}



#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuStringArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [self tableviewHeaderViewHeight];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (_titleString.length) {
        UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, [self tableviewHeaderViewHeight])];
        header.backgroundColor = [UIColor clearColor];
        header.textColor = self.textColor;
        header.font = [UIFont boldSystemFontOfSize:14];
        header.textAlignment = NSTextAlignmentCenter;
        header.text = _titleString;
        return header;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FTPopTableViewControllerCellIdentifier"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.menuStringArray[indexPath.row];
    cell.textLabel.textColor = self.textColor;
    cell.imageView.image = [UIImage imageNamed:@"button-folder"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController {
    
    if (self.barButtonItem) {
        self.popoverPresentationController.barButtonItem = self.barButtonItem;
    } else {
        self.popoverPresentationController.sourceView = self.sourceView;
        self.popoverPresentationController.sourceRect = self.sourceView.bounds;
    }
    self.preferredContentSize = CGSizeMake(self.perferdWidth,[self contentHeight]);

    popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    popoverPresentationController.passthroughViews = nil;
    popoverPresentationController.popoverLayoutMargins = UIEdgeInsetsMake(40, 0, 0, 0);
    popoverPresentationController.backgroundColor = self.tintColor;
  
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    return YES;
}

- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView  * __nonnull * __nonnull)view {
    if (view != NULL) {
        *view = self.sourceView;
    }
    
    if (rect) {
        *rect = self.sourceView.bounds;
    }
}
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    
    
}


#pragma mark - UIAdaptivePresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        return UIModalPresentationFullScreen;
    } else {
        return UIModalPresentationNone;
    }
}

- (UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style {
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller.presentedViewController];
    return navController;
}


#pragma mark - Actions

- (void)dismiss {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 
                             }];
}



@end
