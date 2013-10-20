//
//  ClockViewController.m
//  AlamTest1
//
//  Created by zheng xianzi on 2013/10/12.
//  Copyright (c) 2013年 zheng xianzi. All rights reserved.
//

#import "ClockViewController.h"


@interface ClockViewController ()

@end

@implementation ClockViewController
+(void)initialize
{
    NSMutableDictionary *UserInfo = [NSMutableDictionary dictionary];
    [UserInfo setObject:@"未設定" forKey:@"Username"];
    [UserInfo setObject:@"00" forKey:@"AlarmHour"];
    [UserInfo setObject:@"00" forKey:@"AlarmMin"];
    NSUserDefaults * usersave=[NSUserDefaults standardUserDefaults];
    [usersave registerDefaults:UserInfo];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.AlarmSwitch.on=NO;
    self.AlarmOn=NO;
    
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Counter:) userInfo:nil repeats:YES];
    NSUserDefaults *loadData=[NSUserDefaults standardUserDefaults];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"Alarm" ofType:@"caf"];
    NSURL *url=[NSURL fileURLWithPath:path];
    self.AlarmSound=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    self.AlarmSound.numberOfLoops=-1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Counter:(NSTimer *)timer{
    NSDate *today = [NSDate date];
    
    NSDateFormatter *nowhour = [[NSDateFormatter alloc]init];
    NSDateFormatter *nowmin = [[NSDateFormatter alloc]init];
    NSDateFormatter *nowsec = [[NSDateFormatter alloc]init];
    
    nowhour.dateFormat = @"HH";
    nowmin.dateFormat = @"mm";
    nowsec.dateFormat = @"ss";
    
    self.hour = [[nowhour stringFromDate:today] intValue];
    self.min  = [[nowmin stringFromDate:today] intValue];
    self.sec  = [[nowsec stringFromDate:today] intValue];
    
    
    if (self.AlarmOn == YES) {
        NSUserDefaults * loadData = [NSUserDefaults standardUserDefaults];
        if ((self.hour ==[[loadData objectForKey:@"AlarmHour"]intValue] )&&(self.min == [[loadData objectForKey:@"AlarmMin"]intValue])) {
            NSLog(@"Alarm!!");
            [self.AlarmSound play];
        }
        else{
            [self.AlarmSound stop];
        }
    }
    else {
        [self.AlarmSound stop];
    }
}
- (IBAction)ToSettingAction:(id)sender {
    
    SettingVC * SVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingVC"];
    SVC.modalPresentationStyle = UIModalPresentationFormSheet;
    SVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:SVC animated:YES completion:nil];
}
- (IBAction)SwitchAction:(id)sender {
    if (self.AlarmSwitch.on == YES) {
        //self.AlarmSwitch.on = NO;
        NSLog(@"1");
        self.AlarmOn = YES;
    }
    else{
        //self.AlarmSwitch.on = YES;
        NSLog(@"2");
        self.AlarmOn = NO ;
        if ([self.AlarmSound play]) {
            [self.AlarmSound stop];
        }
    }

}
@end
