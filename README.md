# FTPopOverMenu

[![Twitter](https://img.shields.io/badge/twitter-@liufengting-blue.svg?style=flat)](http://twitter.com/liufengting) 
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/liufengting/FTPopOverMenu/master/LICENSE)
[![Version](https://img.shields.io/cocoapods/v/FTPopOverMenu.svg?style=flat)](http://cocoapods.org/pods/FTPopOverMenu)
[![Platform](https://img.shields.io/cocoapods/p/FTPopOverMenu.svg?style=flat)](http://cocoapods.org/pods/FTPopOverMenu)
[![Download](https://img.shields.io/cocoapods/dt/FTPopOverMenu.svg?maxAge=2592000)](http://cocoapods.org/pods/FTPopOverMenu)
[![CI Status](http://img.shields.io/travis/liufengting/FTPopOverMenu.svg?style=flat)](https://travis-ci.org/liufengting/FTPopOverMenu)
[![GitHub stars](https://img.shields.io/github/stars/liufengting/FTPopOverMenu.svg)](https://github.com/liufengting/FTPopOverMenu/stargazers)
[![Gitter](https://badges.gitter.im/liufengting/FTPopOverMenu.svg)](https://gitter.im/liufengting/FTPopOverMenu?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)


A pop over menu which is maybe the easiest one to use. Now supports both portrait and landscape.

## ScreenShots

<img src="/ScreenShots/Demo.gif" width="250"/>

##Installation

###Manually
* clone this repo.
* Simply drop the '/FTPopOverMenu' folder into your project.
* import 'FTPopOverMenu.h'
* Enjoy！ 

###Cocoapods
FTPopOverMenu is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'FTPopOverMenu'
```

## Useage

### setTintColor

```objective-c
    [FTPopOverMenu setTintColor:[UIColor redColor]];
```

### From SenderView, Menu Without Images
 
```objective-c
    [FTPopOverMenu showForSender:sender
                        withMenu:@[@"MenuOne",@"MenuTwo",@"MenuThr"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                       } dismissBlock:^{
                          
                       }];
```

### From SenderView, Menu With Images
 
```objective-c
    [FTPopOverMenu showForSender:sender
                        withMenu:@[@"MenuOne",@"MenuTwo",@"MenuThr"]
                  imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                       } dismissBlock:^{
                          
                       }];
```
### From SenderFrame/NavigationItem, Menu Without Images
 
```objective-c
    [FTPopOverMenu showFromSenderFrame:CGRectMake(self.view.frame.size.width - 40, 20, 40, 40)
                              withMenu:@[@"123",@"234",@"345"]
                             doneBlock:^(NSInteger selectedIndex) {
                                 
                             } dismissBlock:^{
                                 
                             }];
```

### From SenderFrame/NavigationItem, Menu With Images
 
```objective-c
    [FTPopOverMenu showFromSenderFrame:CGRectMake(self.view.frame.size.width - 40, 20, 40, 40)
                              withMenu:@[@"123",@"234",@"345"]
                        imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                             doneBlock:^(NSInteger selectedIndex) {
                                 
                             } dismissBlock:^{
                                 
                             }];
```

### From barButtonItems 

- First: add action with event to you barButtonItems 

```objective-c
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(onNavButtonTapped:event:)]];
```

- Second: implement the action

```objective-c
-(void)onNavButtonTapped:(UIBarButtonItem *)sender event:(UIEvent *)event
{

    [FTPopOverMenu showFromEvent:event
                        withMenu:@[@"123",@"234",@"345"]
                  imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                       } dismissBlock:^{
                           
                       }];
}
```



# More

 Look for another way of doing this? [See Here](https://github.com/liufengting/FTPopMenu)



## License

FTPopOverMenu is available under the MIT license. See the LICENSE file for more info.


