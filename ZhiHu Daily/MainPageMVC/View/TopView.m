//
//  TopView.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/1/12.
//

#import "TopView.h"
#import "Masonry.h"
#import "MainPageViewController.h"
#import "LogPageViewController.h"
@implementation TopView



- (instancetype)init{
    self = [super init];
    if(self){

        [self addSubview:self.dateLab];
        [self addSubview:self.monthLab];
        [self addSubview:self.separate];
        [self addSubview:self.zhiHuLab];
        [self addSubview:self.headBtn];

     //Masonry
        [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).mas_offset(5);
            make.left.mas_equalTo(self).mas_offset(15);
            make.width.mas_offset(30);
            make.height.mas_offset(30);
        }];//dateLab
        [self.monthLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.dateLab).mas_offset(28);
            make.left.mas_equalTo(self.dateLab).mas_offset(0);
            make.width.mas_equalTo(self.dateLab.mas_width).mas_offset(10);
            make.height.mas_equalTo(self.dateLab).mas_offset(-15);
            
        }];//monthLab
        [self.separate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.dateLab).mas_offset(0);
            make.left.mas_equalTo(self.dateLab.mas_right).mas_offset(15);
            make.height.mas_equalTo(self.dateLab.mas_height).mas_offset(15);
            make.width.mas_offset(20);
            
        }];//separate
        [self.zhiHuLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.dateLab).mas_offset(0);
            make.left.mas_equalTo(self.separate.mas_right).mas_offset(5);
            make.height.mas_equalTo(self.separate.mas_height).mas_offset(0);
            make.width.mas_offset(120);
        }];//zhiHuLab
        [self.headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.dateLab).mas_offset(5);
            make.right.mas_equalTo(self).mas_offset(-30);
            make.width.mas_offset(35);
            make.height.mas_offset(35);
        }];
    }
    return self;
}

//获取到该view所属的ViewController的方法
- (UIViewController*)viewController {
for(UIView* next = [self superview]; next; next = next.superview) {
    UIResponder *nextResponder = [next nextResponder];
    if([nextResponder isKindOfClass:[UIViewController class]]) {
        return(UIViewController*)nextResponder;
        }
}
    return nil;

}

#pragma mark - Lazy


- (UILabel *)dateLab{
    if(_dateLab == nil){
        NSDate* date = [NSDate date];
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"d"];
        NSString* dateStr = [dateFormat stringFromDate:date];
        _dateLab = [[UILabel alloc] init];
        _dateLab.text = dateStr;
        _dateLab.textColor = UIColor.blackColor;
        _dateLab.backgroundColor = UIColor.whiteColor;
        _dateLab.font = [UIFont systemFontOfSize:24];
        _dateLab.textAlignment = NSTextAlignmentCenter;



    }
    return _dateLab;
}

- (UILabel *)monthLab{
    if(_monthLab == nil){
        _monthLab = [[UILabel alloc] init];
        NSDate* date = [NSDate date];
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"M"];
        NSString* dateStr = [dateFormat stringFromDate:date];
        NSString *monthStr;
        int month = dateStr.intValue;
        switch(month){
            case 1:
                monthStr = @"一月";
                break;
            case 2:
                monthStr = @"二月";
                break;
            case 3:
                monthStr = @"三月";
                break;
            case 4:
                monthStr = @"四月";
                break;
            case 5:
                monthStr = @"五月";
                break;
            case 6:
                monthStr = @"六月";
                break;
            case 7:
                monthStr = @"七月";
                break;
            case 8:
                monthStr = @"八月";
                break;
            case 9:
                monthStr = @"九月";
                break;
            case 10:
                monthStr = @"十月";
                break;
            case 11:
                monthStr = @"十一月";
                break;
            case 12:
                monthStr = @"十二月";
                break;
        }
        _monthLab.text = monthStr;
        _monthLab.textColor = UIColor.blackColor;
        _monthLab.backgroundColor = UIColor.whiteColor;
        _monthLab.font = [UIFont systemFontOfSize:12];
        _monthLab.textAlignment = NSTextAlignmentCenter;
        

    }
    return _monthLab;
}

- (UIImageView *)separate{
    if(_separate == nil){
        _separate = [[UIImageView alloc] init];
        _separate.image = [UIImage imageNamed:@"separate"];
    }
    return _separate;
}

- (UILabel *)zhiHuLab{
    if(_zhiHuLab == nil){
        _zhiHuLab = [[UILabel alloc] init];
        NSDate* date = [NSDate date];
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"H"];
        NSString* hourStr = [dateFormat stringFromDate:date];
        int hour = hourStr.intValue;
        if(hour >= 22 || hour <= 2){
            _zhiHuLab.text = @"早点休息";
        }else if(hour >= 7 && hour <= 9){
            _zhiHuLab.text = @"早上好";
        }else{
            _zhiHuLab.text = @"知乎日报";
        }
       
        _zhiHuLab.backgroundColor = UIColor.whiteColor;
        _zhiHuLab.textColor = UIColor.blackColor;
        _zhiHuLab.textAlignment = NSTextAlignmentLeft;
        _zhiHuLab.font = [UIFont boldSystemFontOfSize:25];
    }
    return _zhiHuLab;
}

- (UIButton *)headBtn{
    if(_headBtn == nil){
        _headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headBtn.adjustsImageWhenHighlighted = NO;
        if([MainPageViewController isLog]== NO){
            [_headBtn setBackgroundImage:[UIImage imageNamed:@"headshot2"] forState:UIControlStateNormal];
            [_headBtn addTarget:self action:@selector(log:) forControlEvents:UIControlEventTouchUpInside];
        }else if([MainPageViewController isLog] == YES){
            [_headBtn setBackgroundImage:[UIImage imageNamed:@"headshot"] forState:UIControlStateNormal];
        }
    }
    return _headBtn;
}

-(void) log:(UIButton *) button{
    LogPageViewController *lvc = [[LogPageViewController alloc] init];
    [[self viewController].navigationController pushViewController:lvc animated:YES];
}
@end
