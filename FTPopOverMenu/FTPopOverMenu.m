//
//  FTPopOverMenu.m
//  FTPopOverMenu
//
//  Created by liufengting on 16/4/5.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "FTPopOverMenu.h"

#define KSCREEN_WIDTH               [[UIScreen mainScreen] bounds].size.width
#define KSCREEN_HEIGHT              [[UIScreen mainScreen] bounds].size.height
#define FTBackgroundColor           [UIColor clearColor]
#define FTDefaultTintColor          [UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1.f]
#define FTDefaultTextColor          [UIColor whiteColor]
#define FTDefaultMenuFont           [UIFont systemFontOfSize:14]
#define FTDefaultMenuWidth          (KSCREEN_WIDTH / 2) + (KSCREEN_WIDTH / 4)
#define FTDefaultMenuHeight         (KSCREEN_HEIGHT / 1.3)
#define FTDefaultMenuIconWidth      20.0
#define FTDefaultMenuRowHeight      30.0
#define FTDefaultMenuArrowHeight    10.0
#define FTDefaultMenuArrowWidth     7.0
#define FTDefaultMenuCornerRadius   6.0
#define FTDefaultMargin             4.0
#define FTDefaultAnimationDuration  0.2

#define FTPopOverMenuTableViewCellIndentifier @"FTPopOverMenuTableViewCellIndentifier"



#pragma mark - FTPopOverMenuCell
@interface FTPopOverMenuCell ()
@property (nonatomic, strong) UIImageView *iconImageView, *isActive;
@property (nonatomic, strong) UILabel *menuNameLabel;
@end


@implementation FTPopOverMenuCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuName:(NSString *)menuName iconImageName:(NSString *)iconImageName isActive:(NSString *)isActive
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        CGFloat margin = (FTDefaultMenuRowHeight - FTDefaultMenuIconWidth) / 2;
        UIImage *iconImage = [UIImage imageNamed:iconImageName];
        CGRect iconImageRect = CGRectMake(margin,
                                          margin,
                                          FTDefaultMenuIconWidth,
                                          FTDefaultMenuIconWidth);
        
        CGRect menuNameRect = CGRectMake(FTDefaultMenuRowHeight,
                                         margin,
                                         FTDefaultMenuWidth - FTDefaultMenuIconWidth - margin,
                                         FTDefaultMenuIconWidth);
        if (iconImage) {
            _iconImageView = [[UIImageView alloc]initWithFrame:iconImageRect];
            _iconImageView.backgroundColor = [UIColor clearColor];
            _iconImageView.image = [iconImage imageTintedWithColor:colorAppTint];
            [self addSubview:_iconImageView];
        } else {
            menuNameRect = CGRectMake(margin,
                                      margin,
                                      FTDefaultMenuWidth - margin * 2,
                                      FTDefaultMenuIconWidth);
        }
        _menuNameLabel = [[UILabel alloc]initWithFrame:menuNameRect];
        _menuNameLabel.backgroundColor = [UIColor clearColor];
        _menuNameLabel.font = [UIFont systemFontOfSize:13];
        _menuNameLabel.textColor = FTDefaultTextColor;
        _menuNameLabel.text = menuName;
        [self addSubview:_menuNameLabel];
        
        CGRect activeImageRect = CGRectMake(FTDefaultMenuWidth - (margin * 5),
                                            margin,
                                            FTDefaultMenuIconWidth,
                                            FTDefaultMenuIconWidth);
        
        _isActive = [[UIImageView alloc]initWithFrame:activeImageRect];
        _isActive.backgroundColor = [UIColor clearColor];
        _isActive.image = [[UIImage imageNamed:@"isActive"] imageTintedWithColor:colorBadgeColor];
        _isActive.hidden = [isActive boolValue];
        [self addSubview:_isActive];
    }
    return self;
}
@end



#pragma mark - FTPopOverMenuView
@interface FTPopOverMenuView () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) NSArray<NSString *> *menuStringArray;
@property (nonatomic, strong) NSArray<NSString *> *menuIconNameArray;
@property (nonatomic, strong) NSArray<NSString *> *menuIsActive;
@property (nonatomic, assign) FTPopOverMenuArrowDirection arrowDirection;
@property (nonatomic, strong) FTPopOverMenuDoneBlock doneBlock;
@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@end


@implementation FTPopOverMenuView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _menuTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _menuTableView.backgroundColor = FTBackgroundColor;
        _menuTableView.separatorColor = [UIColor grayColor];
        _menuTableView.layer.cornerRadius = FTDefaultMenuCornerRadius;
        _menuTableView.separatorInset = UIEdgeInsetsMake(0, FTDefaultMargin, 0, FTDefaultMargin);
        _menuTableView.scrollEnabled = YES;
        _menuTableView.clipsToBounds = YES;
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        [self addSubview:_menuTableView];
    }
    return self;
}

-(void)showWithAnglePoint:(CGPoint)anglePoint
            withNameArray:(NSArray<NSString*> *)nameArray
           imageNameArray:(NSArray<NSString*> *)imageNameArray
            isActiveArray:(NSArray<NSString*> *)menuIsActive
           arrowDirection:(FTPopOverMenuArrowDirection)arrowDirection
                doneBlock:(FTPopOverMenuDoneBlock)doneBlock
{
    _menuStringArray = nameArray;
    _menuIconNameArray = imageNameArray;
    _menuIsActive = menuIsActive;
    _arrowDirection = arrowDirection;
    
    self.doneBlock = doneBlock;
    [_menuTableView reloadData];
    switch (_arrowDirection) {
        case FTPopOverMenuArrowDirectionUp:
            _menuTableView.frame = CGRectMake(0, FTDefaultMenuArrowHeight, self.frame.size.width, self.frame.size.height - FTDefaultMenuArrowHeight);
            break;
            
        case FTPopOverMenuArrowDirectionDown:
            _menuTableView.frame = CGRectMake(0, FTDefaultMenuArrowHeight, self.frame.size.width, self.frame.size.height - FTDefaultMenuArrowHeight);
            //_menuTableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - FTDefaultMenuArrowHeight);
            break;
    //TODO:
        case FTPopOverMenuArrowDirectionLeft:
            
            break;
        case FTPopOverMenuArrowDirectionRight:
            
            break;
            
        default:
            break;
    }
    [self drawBackgroundLayerWithAnglePoint:anglePoint];
}

-(void)drawBackgroundLayerWithAnglePoint:(CGPoint)anglePoint
{
    if (_backgroundLayer) {
        [_backgroundLayer removeFromSuperlayer];
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];

    switch (_arrowDirection) {
        case FTPopOverMenuArrowDirectionUp:{
         
            [path moveToPoint:anglePoint];
            [path addLineToPoint:CGPointMake( anglePoint.x - FTDefaultMenuArrowWidth, FTDefaultMenuArrowHeight)];
            [path addLineToPoint:CGPointMake( FTDefaultMenuCornerRadius, FTDefaultMenuArrowHeight)];
            [path addArcWithCenter:CGPointMake(FTDefaultMenuCornerRadius, FTDefaultMenuArrowHeight + FTDefaultMenuCornerRadius) radius:FTDefaultMenuCornerRadius startAngle:-M_PI_2 endAngle:-M_PI clockwise:NO];
            [path addLineToPoint:CGPointMake( 0, self.bounds.size.height - FTDefaultMenuCornerRadius)];
            [path addArcWithCenter:CGPointMake(FTDefaultMenuCornerRadius, self.bounds.size.height - FTDefaultMenuCornerRadius) radius:FTDefaultMenuCornerRadius startAngle:M_PI endAngle:M_PI_2 clockwise:NO];
            [path addLineToPoint:CGPointMake( self.bounds.size.width - FTDefaultMenuCornerRadius, self.bounds.size.height)];
            [path addArcWithCenter:CGPointMake(self.bounds.size.width - FTDefaultMenuCornerRadius, self.bounds.size.height - FTDefaultMenuCornerRadius) radius:FTDefaultMenuCornerRadius startAngle:M_PI_2 endAngle:0 clockwise:NO];
            [path addLineToPoint:CGPointMake(self.bounds.size.width , FTDefaultMenuCornerRadius + FTDefaultMenuArrowHeight)];
            [path addArcWithCenter:CGPointMake(self.bounds.size.width - FTDefaultMenuCornerRadius, FTDefaultMenuCornerRadius + FTDefaultMenuArrowHeight) radius:FTDefaultMenuCornerRadius startAngle:0 endAngle:-M_PI_2 clockwise:NO];
            [path addLineToPoint:CGPointMake(anglePoint.x + FTDefaultMenuArrowWidth, FTDefaultMenuArrowHeight)];
            [path closePath];

//        }break;
//        case FTPopOverMenuArrowDirectionDown:{
//            
//            [path moveToPoint:anglePoint];
//            [path addLineToPoint:CGPointMake( anglePoint.x - FTDefaultMenuArrowWidth, anglePoint.y - FTDefaultMenuArrowHeight)];
//            [path addLineToPoint:CGPointMake( FTDefaultMenuCornerRadius, anglePoint.y - FTDefaultMenuArrowHeight)];
//            [path addArcWithCenter:CGPointMake(FTDefaultMenuCornerRadius, anglePoint.y - FTDefaultMenuArrowHeight - FTDefaultMenuCornerRadius) radius:FTDefaultMenuCornerRadius startAngle:-M_PI_2 endAngle:-M_PI clockwise:YES];
//            [path addLineToPoint:CGPointMake( 0, FTDefaultMenuCornerRadius)];
//            [path addArcWithCenter:CGPointMake(FTDefaultMenuCornerRadius, FTDefaultMenuCornerRadius) radius:FTDefaultMenuCornerRadius startAngle:M_PI endAngle:-M_PI_2 clockwise:YES];
//            [path addLineToPoint:CGPointMake( self.bounds.size.width - FTDefaultMenuCornerRadius, 0)];
//            [path addArcWithCenter:CGPointMake(self.bounds.size.width - FTDefaultMenuCornerRadius, FTDefaultMenuCornerRadius) radius:FTDefaultMenuCornerRadius startAngle:-M_PI_2 endAngle:0 clockwise:YES];
//            [path addLineToPoint:CGPointMake(self.bounds.size.width , anglePoint.y - (FTDefaultMenuCornerRadius + FTDefaultMenuArrowHeight))];
//            [path addArcWithCenter:CGPointMake(self.bounds.size.width - FTDefaultMenuCornerRadius, anglePoint.y - (FTDefaultMenuCornerRadius + FTDefaultMenuArrowHeight)) radius:FTDefaultMenuCornerRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
//            [path addLineToPoint:CGPointMake(anglePoint.x + FTDefaultMenuArrowWidth, anglePoint.y - FTDefaultMenuArrowHeight)];
//            [path closePath];
            
        } break;
        default:
            break;
    }
    
    _backgroundLayer = [CAShapeLayer layer];
    _backgroundLayer.path = path.CGPath;
    _backgroundLayer.fillColor = _tintColor ? _tintColor.CGColor : FTDefaultTintColor.CGColor;
    _backgroundLayer.strokeColor = _tintColor ? _tintColor.CGColor : FTDefaultTintColor.CGColor;
    [self.layer insertSublayer:_backgroundLayer atIndex:0];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return FTDefaultMenuRowHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menuStringArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FTPopOverMenuCell *menuCell = [[FTPopOverMenuCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                          reuseIdentifier:FTPopOverMenuTableViewCellIndentifier
                                                                 menuName:[NSString stringWithFormat:@"%@", _menuStringArray[indexPath.row]]
                                                            iconImageName:_menuIconNameArray.count ? [NSString stringWithFormat:@"%@",_menuIconNameArray[indexPath.row]] : @""
                                                                 isActive:_menuIsActive[indexPath.row]];
    return menuCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (self.doneBlock) {
        self.doneBlock(indexPath.row);
    }
}

@end


#pragma mark - FTPopOverMenu

@interface FTPopOverMenu () <UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView * backgroundView;
@property (nonatomic, strong) FTPopOverMenuView *popMenuView;
@property (nonatomic, strong) FTPopOverMenuDoneBlock doneBlock;
@property (nonatomic, strong) FTPopOverMenuDismissBlock dismissBlock;
@end

@implementation FTPopOverMenu
+ (FTPopOverMenu *)sharedInstance
{
    static dispatch_once_t once = 0;
    static FTPopOverMenu *shared;
    dispatch_once(&once, ^{ shared = [[FTPopOverMenu alloc] init]; });
    return shared;
}

#pragma mark - Public Method
+ (void) showForSender:(UIView *)sender
              withMenu:(NSArray<NSString*> *)menuArray
             doneBlock:(FTPopOverMenuDoneBlock)doneBlock
          dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock
{
    [[self sharedInstance] showForSender:sender senderFrame:CGRectNull withMenu:menuArray imageNameArray:nil isActiveArray:nil doneBlock:doneBlock dismissBlock:dismissBlock];
}
#pragma mark - Public Method
+ (void) showForSender:(UIView *)sender
              withMenu:(NSArray<NSString*> *)menuArray
        imageNameArray:(NSArray<NSString*> *)imageNameArray
             doneBlock:(FTPopOverMenuDoneBlock)doneBlock
          dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock;
{
    [[self sharedInstance] showForSender:sender senderFrame:CGRectNull withMenu:menuArray imageNameArray:imageNameArray isActiveArray:nil doneBlock:doneBlock dismissBlock:dismissBlock];
}


+ (void) showForSender:(UIView *)sender
              withMenu:(NSArray<NSString*> *)menuArray
        imageNameArray:(NSArray<NSString*> *)imageNameArray
         isActiveArray:(NSArray<NSString*> *)menuIsActive
             doneBlock:(FTPopOverMenuDoneBlock)doneBlock
          dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock;
{
    [[self sharedInstance] showForSender:sender senderFrame:CGRectNull withMenu:menuArray imageNameArray:imageNameArray isActiveArray:menuIsActive doneBlock:doneBlock dismissBlock:dismissBlock];
}

+ (void) showFromSenderFrame:(CGRect )senderFrame
                   withMenu:(NSArray<NSString*> *)menuArray
                  doneBlock:(FTPopOverMenuDoneBlock)doneBlock
               dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock
{
    [[self sharedInstance] showForSender:nil senderFrame:senderFrame withMenu:menuArray imageNameArray:nil isActiveArray:nil doneBlock:doneBlock dismissBlock:dismissBlock];
}
+ (void) showFromSenderFrame:(CGRect )senderFrame
                    withMenu:(NSArray<NSString*> *)menuArray
              imageNameArray:(NSArray<NSString*> *)imageNameArray
                   doneBlock:(FTPopOverMenuDoneBlock)doneBlock
                dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock
{
    [[self sharedInstance] showForSender:nil senderFrame:senderFrame withMenu:menuArray imageNameArray:imageNameArray isActiveArray:nil doneBlock:doneBlock dismissBlock:dismissBlock];
}

+ (void) showFromSenderFrame:(CGRect )senderFrame
                    withMenu:(NSArray<NSString*> *)menuArray
              imageNameArray:(NSArray<NSString*> *)imageNameArray
               isActiveArray:(NSArray<NSString*> *)menuIsActive
                   doneBlock:(FTPopOverMenuDoneBlock)doneBlock
                dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock
{
    [[self sharedInstance] showForSender:nil senderFrame:senderFrame withMenu:menuArray imageNameArray:imageNameArray isActiveArray:menuIsActive doneBlock:doneBlock dismissBlock:dismissBlock];
}


+(void)dismiss
{
    [[self sharedInstance] dismiss];
}

+(void)setTintColor:(UIColor *)tintColor
{
    [self sharedInstance].popMenuView.tintColor = tintColor;
}

-(void)initViews
{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc ]initWithFrame:[UIScreen mainScreen].bounds];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onBackgroundViewTapped:)];
        tap.delegate = self;
        [_backgroundView addGestureRecognizer:tap];
        _backgroundView.backgroundColor = FTBackgroundColor;
    }
    
    
    if (!_popMenuView) {
        _popMenuView = [[FTPopOverMenuView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
        [_backgroundView addSubview:_popMenuView];
        _popMenuView.alpha = 0;
    }
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:_backgroundView];

}



#pragma mark - Public Method
- (void) showForSender:(UIView *)sender
           senderFrame:(CGRect )senderFrame
              withMenu:(NSArray<NSString*> *)menuArray
        imageNameArray:(NSArray<NSString*> *)imageNameArray
         isActiveArray:(NSArray<NSString*> *)menuIsActive
             doneBlock:(FTPopOverMenuDoneBlock)doneBlock
          dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock
{
    if (imageNameArray.count && menuArray.count && menuIsActive.count != imageNameArray.count) {
        [[[NSException alloc]initWithName:@"imageNameArray.count && menuArray.count && menuIsActive.count != imageNameArray.count"
                                   reason:@"If you do this, it's going to crash! Please check again." userInfo:nil] raise];
    }
    
    [self initViews];
    
    self.doneBlock = doneBlock;
    self.dismissBlock = dismissBlock;

    
    
    CGRect senderRect ;
    
    if (sender) {
        senderRect = [sender.superview convertRect:sender.frame toView:_backgroundView];
    }else{
        senderRect = senderFrame;
    }
    CGFloat menuHeight = FTDefaultMenuRowHeight * menuArray.count + FTDefaultMenuArrowHeight;
    CGPoint menuArrowPoint = CGPointMake(senderRect.origin.x + (senderRect.size.width)/2, 0);
    CGFloat menuX = 0;
    CGRect menuRect = CGRectZero;
    FTPopOverMenuArrowDirection arrowDirection;
    
  //  if (senderRect.origin.y + senderRect.size.height + menuHeight < KSCREEN_HEIGHT) {
        arrowDirection = FTPopOverMenuArrowDirectionUp;
        menuArrowPoint.y = 0;
        
        if (menuArrowPoint.x + FTDefaultMenuWidth/2 + FTDefaultMargin > KSCREEN_WIDTH) {
            menuArrowPoint.x = MIN(menuArrowPoint.x - (KSCREEN_WIDTH - FTDefaultMenuWidth - FTDefaultMargin), menuArrowPoint.x);
            menuX = KSCREEN_WIDTH - FTDefaultMenuWidth - FTDefaultMargin;
        }else if ( menuArrowPoint.x - FTDefaultMenuWidth/2 - FTDefaultMargin < 0){
            menuArrowPoint.x = MAX( FTDefaultMenuCornerRadius + FTDefaultMenuArrowWidth, menuArrowPoint.x - FTDefaultMargin);
            menuX = FTDefaultMargin;
        }else{
            menuArrowPoint.x = FTDefaultMenuWidth/2;
            menuX = senderRect.origin.x + (senderRect.size.height)/2 - FTDefaultMenuWidth/2;
        }
        menuRect = CGRectMake(menuX,
                          (senderRect.origin.y + senderRect.size.height),
                          FTDefaultMenuWidth,
                          (KSCREEN_HEIGHT < menuHeight) ? FTDefaultMenuHeight : menuHeight);
    
        
        
//    }else{
//        arrowDirection = FTPopOverMenuArrowDirectionDown;
//        menuArrowPoint.y = menuHeight;
//        
//        //same with up
//        if (menuArrowPoint.x + FTDefaultMenuWidth/2 + FTDefaultMargin > KSCREEN_WIDTH) {
//            menuArrowPoint.x = MIN(menuArrowPoint.x - (KSCREEN_WIDTH - FTDefaultMenuWidth - FTDefaultMargin), menuArrowPoint.x);
//            menuX = KSCREEN_WIDTH - FTDefaultMenuWidth - FTDefaultMargin;
//        }else if ( menuArrowPoint.x - FTDefaultMenuWidth/2 - FTDefaultMargin < 0){
//            menuArrowPoint.x = MAX( FTDefaultMenuCornerRadius + FTDefaultMenuArrowWidth, menuArrowPoint.x - FTDefaultMargin);
//            menuX = FTDefaultMargin;
//        }else{
//            menuArrowPoint.x = FTDefaultMenuWidth/2;
//            menuX = senderRect.origin.x + (senderRect.size.height)/2 - FTDefaultMenuWidth/2;
//        }
//        //same with up
//        
//        menuRect = CGRectMake(menuX, (senderRect.origin.y - menuHeight), FTDefaultMenuWidth, menuHeight);
//    }
    _popMenuView.frame = menuRect;
    
    [_popMenuView showWithAnglePoint:menuArrowPoint
                       withNameArray:menuArray
                      imageNameArray:imageNameArray
                       isActiveArray:menuIsActive
                      arrowDirection:arrowDirection
                           doneBlock:^(NSInteger selectedIndex) {
                               [self doneActionWithSelectedIndex:selectedIndex];
                           }];
    
    [self show];
}

#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

#pragma mark - onBackgroundViewTapped
-(void)onBackgroundViewTapped:(UIGestureRecognizer *)gesture
{
    [self dismiss];
}

#pragma mark - show animation
- (void)show
{
    [UIView animateWithDuration:FTDefaultAnimationDuration
                     animations:^{
                         _popMenuView.alpha = 1;
                     }];
}

#pragma mark - dismiss animation
- (void)dismiss
{
    [self doneActionWithSelectedIndex:-1];
}

#pragma mark - doneActionWithSelectedIndex
-(void)doneActionWithSelectedIndex:(NSInteger)selectedIndex
{
    [UIView animateWithDuration:FTDefaultAnimationDuration
                     animations:^{
                         _popMenuView.alpha = 0;
                     }completion:^(BOOL finished) {
                         if (finished) {
                             [_backgroundView removeFromSuperview];
                             
                             if (selectedIndex < 0) {
                                 if (self.dismissBlock) {
                                     self.dismissBlock();
                                 }
                             } else {
                                 if (self.doneBlock) {
                                     self.doneBlock(selectedIndex);
                                 }
                             }
                         }
                     }];
}

@end