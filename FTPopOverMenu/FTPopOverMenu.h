//
//  FTPopOverMenu.h
//  FTPopOverMenu
//
//  Created by liufengting on 16/4/5.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  FTPopOverMenuArrowDirection
 */
typedef NS_ENUM(NSUInteger, FTPopOverMenuArrowDirection) {
    FTPopOverMenuArrowDirectionUp,
    FTPopOverMenuArrowDirectionDown,
    FTPopOverMenuArrowDirectionLeft,
    FTPopOverMenuArrowDirectionRight,
    FTPopOverMenuArrowDirectionNone
};

/**
 *  FTPopOverMenuDoneBlock
 *
 *  @param index SlectedIndex
 */
typedef void (^FTPopOverMenuDoneBlock)(NSInteger selectedIndex);
/**
 *  FTPopOverMenuDismissBlock
 */
typedef void (^FTPopOverMenuDismissBlock)();

/**
 *  FTPopOverMenuCell
 */
@interface FTPopOverMenuCell : UITableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuName:(NSString *)menuName iconImageName:(NSString *)iconImageName;

@end
/**
 *  FTPopOverMenuView
 */
@interface FTPopOverMenuView : UIControl

@property (nonatomic,strong)UIColor *tintColor;
/**
 *  Show Method
 *
 *  @param anglePoint     anglePoint
 *  @param nameArray      nameArray
 *  @param imageNameArray imageNameArray
 *  @param arrowDirection arrowDirection
 *  @param doneBlock      FTPopOverMenuDoneBlock
 */
-(void)showWithAnglePoint:(CGPoint)anglePoint
            withNameArray:(NSArray<NSString*> *)nameArray
           imageNameArray:(NSArray<NSString*> *)imageNameArray
           arrowDirection:(FTPopOverMenuArrowDirection)arrowDirection
                doneBlock:(FTPopOverMenuDoneBlock)doneBlock;
@end




/**---------------------------------------------------------------------
 *  -----------------------FTPopOverMenu-----------------------
 */
@interface FTPopOverMenu : NSObject

/**
 *  setTintColor
 *
 *  @param tintColor tintColor
 */
+(void)setTintColor:(UIColor *)tintColor;

/**
 *  show method with sender without images
 *
 *  @param sender       sender
 *  @param menuArray    menuArray
 *  @param doneBlock    FTPopOverMenuDoneBlock
 *  @param dismissBlock FTPopOverMenuDismissBlock
 */
+ (void) showForSender:(UIView *)sender
              withMenu:(NSArray<NSString*> *)menuArray
             doneBlock:(FTPopOverMenuDoneBlock)doneBlock
          dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock;

/**
 *  show method with sender with imageNameArray
 *
 *  @param sender         sender
 *  @param menuArray      menuArray
 *  @param imageNameArray imageNameArray
 *  @param doneBlock      FTPopOverMenuDoneBlock
 *  @param dismissBlock   FTPopOverMenuDismissBlock
 */
+ (void) showForSender:(UIView *)sender
              withMenu:(NSArray<NSString*> *)menuArray
        imageNameArray:(NSArray<NSString*> *)imageNameArray
             doneBlock:(FTPopOverMenuDoneBlock)doneBlock
          dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock;

/**
 *  show method for barbuttonitems with event without images
 *
 *  @param event          UIEvent
 *  @param menuArray      menuArray
 *  @param doneBlock      FTPopOverMenuDoneBlock
 *  @param dismissBlock   FTPopOverMenuDismissBlock
 */
+ (void) showFromEvent:(UIEvent *)event
              withMenu:(NSArray<NSString*> *)menuArray
             doneBlock:(FTPopOverMenuDoneBlock)doneBlock
          dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock;

/**
 *  show method for barbuttonitems with event with imageNameArray
 *
 *  @param event          UIEvent
 *  @param menuArray      menuArray
 *  @param imageNameArray imageNameArray
 *  @param doneBlock      FTPopOverMenuDoneBlock
 *  @param dismissBlock   FTPopOverMenuDismissBlock
 */
+ (void) showFromEvent:(UIEvent *)event
              withMenu:(NSArray<NSString*> *)menuArray
        imageNameArray:(NSArray<NSString*> *)imageNameArray
             doneBlock:(FTPopOverMenuDoneBlock)doneBlock
          dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock;

/**
 *  show method with SenderFrame without images
 *
 *  @param senderFrame  senderFrame
 *  @param menuArray    menuArray
 *  @param doneBlock    doneBlock
 *  @param dismissBlock dismissBlock
 */
+ (void) showFromSenderFrame:(CGRect )senderFrame
                    withMenu:(NSArray<NSString*> *)menuArray
                   doneBlock:(FTPopOverMenuDoneBlock)doneBlock
                dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock;
/**
 *  show method with SenderFrame with imageNameArray
 *
 *  @param senderFrame    senderFrame
 *  @param menuArray      menuArray
 *  @param imageNameArray imageNameArray
 *  @param doneBlock      doneBlock
 *  @param dismissBlock   dismissBlock

 */
+ (void) showFromSenderFrame:(CGRect )senderFrame
                    withMenu:(NSArray<NSString*> *)menuArray
              imageNameArray:(NSArray<NSString*> *)imageNameArray
                   doneBlock:(FTPopOverMenuDoneBlock)doneBlock
                dismissBlock:(FTPopOverMenuDismissBlock)dismissBlock;
/**
 *  dismiss method
 */
+ (void) dismiss;

@end
