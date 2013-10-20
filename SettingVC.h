//
//  SettingVC.h
//  AlamTest1
//
//  Created by zheng xianzi on 2013/10/12.
//  Copyright (c) 2013年 zheng xianzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingVC : UIViewController<UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UIDatePicker *DP;
@property (strong, nonatomic) IBOutlet UILabel *AlarmTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *ProfileLabel;
- (IBAction)SettingTimeAction:(id)sender;
- (IBAction)CallDPAction:(id)sender;
- (IBAction)CallUIActionSheetAction:(id)sender;
- (IBAction)CannelAction:(id)sender;
- (IBAction)SettingSaveAction:(id)sender;

@property (nonatomic)NSString * settinghour;
@property (nonatomic)NSString * settingminiute;
@property (nonatomic)NSString * settingname;


@end
