//
//  ClockViewController.h
//  AlamTest1
//
//  Created by zheng xianzi on 2013/10/12.
//  Copyright (c) 2013年 zheng xianzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingVC.h"
#import <AVFoundation/AVFoundation.h>


@interface ClockViewController : UIViewController

- (IBAction)ToSettingAction:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *AlarmSwitch;
- (IBAction)SwitchAction:(id)sender;


@property (nonatomic) int hour;
@property (nonatomic) int min;
@property (nonatomic) int sec;
@property (nonatomic) BOOL AlarmOn;
@property (nonatomic) AVAudioPlayer *AlarmSound;

@end
