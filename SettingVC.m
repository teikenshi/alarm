//
//  SettingVC.m
//  AlamTest1
//
//  Created by zheng xianzi on 2013/10/12.
//  Copyright (c) 2013年 zheng xianzi. All rights reserved.
//

#import "SettingVC.h"

@interface SettingVC ()

@end

@implementation SettingVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.DP.enabled = FALSE;
    self.DP.hidden = TRUE;
    
    NSUserDefaults * loadData = [NSUserDefaults standardUserDefaults];
    
    self.AlarmTimeLabel.text = [NSString stringWithFormat:@"%@:%@",[loadData objectForKey:@"AlarmHour"],[loadData objectForKey:@"AlarmMin"]];
    self.ProfileLabel.text = [NSString stringWithFormat:@"%@",[loadData objectForKey:@"Username"]];
    self.settingname = self.ProfileLabel.text;
    self.settinghour = [loadData objectForKey:@"AlarmHour"];
    self.settingminiute = [loadData objectForKey:@"AlarmMin"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)SettingTimeAction:(id)sender {
    NSDateFormatter *dhour = [[NSDateFormatter alloc]init];
    NSDateFormatter *dmin = [[NSDateFormatter alloc]init];
    NSDateFormatter *dsetting = [[NSDateFormatter alloc]init];
    dsetting.dateFormat = @"HH:mm";
    dhour.dateFormat = @"HH";
    dmin.dateFormat = @"mm";
    self.settinghour = [dhour stringFromDate:self.DP.date];
    self.settingminiute = [dmin stringFromDate:self.DP.date];
    self.AlarmTimeLabel.text = [NSString stringWithFormat:@"%@",[dsetting stringFromDate:self.DP.date]];
    
}

- (IBAction)CallDPAction:(id)sender {
    self.DP.enabled = TRUE;
    self.DP.hidden = FALSE;
}

- (IBAction)CallUIActionSheetAction:(id)sender {
    UIActionSheet * sheet = [[UIActionSheet alloc]init];
    sheet.delegate = self;
    sheet.title = @"プロフィール選択してください";
    [sheet addButtonWithTitle:@"学生"];
    [sheet addButtonWithTitle:@"社会人"];
    [sheet addButtonWithTitle:@"キャンセル"];
    sheet.cancelButtonIndex = 2;
    sheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [sheet showInView:self.view];
}

- (IBAction)CannelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)SettingSaveAction:(id)sender {
    NSLog(@"%@,%@,%@",self.settingname,self.settinghour,self.settingminiute);
    NSUserDefaults * saveData = [NSUserDefaults standardUserDefaults];
    [saveData setObject:self.settingname forKey:@"Username"];
    [saveData setObject:self.settinghour forKey:@"AlarmHour"];
    [saveData setObject:self.settingminiute forKey:@"AlarmMin"];
    [saveData synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)actionSheet:(UIActionSheet *)actionSheet  clickedButtonAtIndex:(NSInteger)buttonIndex { // アクションシート選択時の処理
    switch (buttonIndex) {
        case 0:
            self.ProfileLabel.text = @"学生";
            break;
        case 1:
            self.ProfileLabel.text = @"社会人";
            break;
        
        default:
            break;
    }
    self.settingname = self.ProfileLabel.text;
}
@end
