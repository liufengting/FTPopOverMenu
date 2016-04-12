# FTPopOverMenu

FTPopOverMenu. A pop over menu which is maybe the easiest to use.

## Useage



```objective-c

    [FTPopOverMenu showForSender:sender
                        withMenu:@[@"MenuOne",@"MenuTwo",@"MenuThr"]
                  imageNameArray:@[@"setting_icon",@"setting_icon",@"setting_icon"]
                       doneBlock:^(NSInteger selectedIndex) {
                           NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                           
                       } dismissBlock:^{
                           NSLog(@"user canceled. do nothing.");
                           
                       }];

```

## ScreenShots


<!--<img src="/ScreenShots/ScreenShot01.jpg" width="400"/>-->
![FTPopOverMenu Sample gif](/ScreenShots/Demo.gif)


