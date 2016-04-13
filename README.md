# FTPopOverMenu

FTPopOverMenu. A pop over menu which is maybe the easiest one to use.

[![Twitter Follow](https://img.shields.io/twitter/follow/liufengting.svg?style=social)](https://twitter.com/liufengting)

## ScreenShots

<img src="/ScreenShots/Demo.gif" width="400"/>

## Useage

* setTintColor

```objective-c
    [FTPopOverMenu setTintColor:[UIColor redColor]];
```

* From SenderView, Menu Without Images
 
```objective-c
    [FTPopOverMenu showForSender:sender
                        withMenu:@[@"MenuOne",@"MenuTwo",@"MenuThr"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                       } dismissBlock:^{
                          
                       }];
```

* From SenderView, Menu With Images
 
```objective-c
    [FTPopOverMenu showForSender:sender
                        withMenu:@[@"MenuOne",@"MenuTwo",@"MenuThr"]
                  imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                       } dismissBlock:^{
                          
                       }];
```
* From SenderFrame, Menu Without Images
 
```objective-c
    [FTPopOverMenu showFromSenderFrame:CGRectMake(self.view.frame.size.width - 40, 20, 40, 40)
                              withMenu:@[@"123",@"234",@"345"]
                             doneBlock:^(NSInteger selectedIndex) {
                                 
                             } dismissBlock:^{
                                 
                             }];
```

* From SenderFrame, Menu With Images
 
```objective-c
    [FTPopOverMenu showFromSenderFrame:CGRectMake(self.view.frame.size.width - 40, 20, 40, 40)
                              withMenu:@[@"123",@"234",@"345"]
                        imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                             doneBlock:^(NSInteger selectedIndex) {
                                 
                             } dismissBlock:^{
                                 
                             }];
```

##Installation
* clone this repo.
* Simply drop the /FTPopOverMenu folder into your project.
* import "FTPopOverMenu.h"
* Enjoy！ 😊




