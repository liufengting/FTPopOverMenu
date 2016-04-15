# FTPopOverMenu

FTPopOverMenu. A pop over menu which is maybe the easiest one to use.

[![Twitter](https://img.shields.io/badge/twitter-@liufengting-blue.svg?style=flat)](http://twitter.com/liufengting) 
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/liufengting/FTPopOverMenu/master/LICENSE)
[![GitHub forks](https://img.shields.io/github/forks/liufengting/FTPopOverMenu.svg)](https://github.com/liufengting/FTPopOverMenu/network)
[![GitHub stars](https://img.shields.io/github/stars/liufengting/FTPopOverMenu.svg)](https://github.com/liufengting/FTPopOverMenu/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/liufengting/FTPopOverMenu.svg)](https://github.com/liufengting/FTPopOverMenu/issues)



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




