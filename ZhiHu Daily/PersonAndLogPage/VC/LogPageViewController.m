//
//  LogPageViewController.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/24.
//

//@property(strong,nonatomic) UILabel *lab1;//登陆知乎日报
//@property(strong,nonatomic) UILabel *lab2;//选择登陆方式
//@property(strong,nonatomic) UILabel *lab3;//我同意知乎协议和个人信息保护指引
//@property(strong,nonatomic) UILabel *lab4;//夜间模式
//@property(strong,nonatomic) UILabel *lab5;//设置
//@property(strong,nonatomic) UIButton *btn1;//知乎
//@property(strong,nonatomic) UIButton *btn2;//微博
//@property(strong,nonatomic) UIButton *btn3;//apple
//@property(strong,nonatomic) UIButton *btn4;//夜间模式
//@property(strong,nonatomic) UIButton *btn5;//设置
//@property(strong,nonatomic) UIButton *btn6;//勾勾
//@property(strong,nonatomic) UIButton *btn7;//返回

#import "LogPageViewController.h"
#import "Masonry.h"
#import "PersonPageViewController.h"
#import "MainPageViewController.h"

@interface LogPageViewController ()

@end

@implementation LogPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.lab1];
    [self.view addSubview:self.lab2];
    [self.view addSubview:self.lab3];
    [self.view addSubview:self.lab4];
    [self.view addSubview:self.lab5];
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
    [self.view addSubview:self.btn3];
    [self.view addSubview:self.btn4];
    [self.view addSubview:self.btn5];
    [self.view addSubview:self.btn6];
    [self.view addSubview:self.btn7];
    [self.lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(220);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_offset(160);
        make.height.mas_offset(40);
    }];
    [self.lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lab1.mas_bottom).mas_offset(5);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_offset(100);
        make.height.mas_offset(18);
    }];
    [self.lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btn2.mas_bottom).mas_offset(30);
        make.centerX.mas_equalTo(self.view.mas_centerX).mas_offset(22);
        make.width.mas_offset(270);
        make.height.mas_offset(20);
    }];
    [self.lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btn4.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(self.btn4.mas_centerX).mas_offset(0);
        make.width.mas_offset(65);
        make.height.mas_offset(15);
    }];
    [self.lab5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btn5.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(self.btn5.mas_centerX).mas_offset(0);
        make.width.mas_offset(65);
        make.height.mas_offset(15);
    }];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lab2.mas_bottom).mas_offset(25);
        make.right.mas_equalTo(self.btn2.mas_left).mas_offset(-35);
        make.size.mas_offset(48);
    }];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lab2.mas_bottom).mas_offset(25);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_offset(48);
    }];
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lab2.mas_bottom).mas_offset(25);
        make.left.mas_equalTo(self.btn2.mas_right).mas_offset(35);
        make.size.mas_offset(48);
    }];
    [self.btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-90);
        make.centerX.mas_equalTo(self.view).mas_offset(-80);
        make.size.mas_offset(35);
    }];
    [self.btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-90);
        make.centerX.mas_equalTo(self.view).mas_offset(80);
        make.size.mas_offset(35);
    }];
    [self.btn6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.lab3).mas_offset(0);
        make.right.mas_equalTo(self.lab3.mas_left).mas_offset(-5);
        make.size.mas_offset(16);
    }];
    [self.btn7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(70);
        make.left.mas_equalTo(self.view).mas_offset(25);
        make.size.mas_offset(22);
    }];
    
}

#pragma mark -Lazy

- (UILabel *)lab1{
    if(_lab1 == nil){
        _lab1 = [[UILabel alloc] init];
        _lab1.text = @"登陆知乎日报";
        _lab1.font = [UIFont boldSystemFontOfSize:25];
        _lab1.textColor = UIColor.blackColor;
        _lab1.textAlignment = NSTextAlignmentCenter;
    }
    return _lab1;
}

- (UILabel *)lab2{
    if(_lab2 == nil){
        _lab2 = [[UILabel alloc] init];
        _lab2.text = @"选择登录方式";
        _lab2.font = [UIFont systemFontOfSize:15];
        _lab2.textColor = UIColor.grayColor;
        _lab2.textAlignment = NSTextAlignmentCenter;
    }
    return _lab2;
}

- (UILabel *)lab3{
    if(_lab3 == nil){
        _lab3 = [[UILabel alloc] init];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"我同意《知乎协议》和《个人信息保护指引》"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0,3)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(3,6)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(9,1)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(10,10)];
        _lab3.attributedText = str;
        _lab3.font = [UIFont systemFontOfSize:12];
    }
    return _lab3;
}

- (UILabel *)lab4{
    if(_lab4 == nil){
        _lab4 = [[UILabel alloc] init];
        _lab4.text = @"夜间模式";
        _lab4.font = [UIFont systemFontOfSize:14];
        _lab4.textAlignment = NSTextAlignmentCenter;
    }
    return _lab4;
}

- (UILabel *)lab5{
    if(_lab5 == nil){
        _lab5 = [[UILabel alloc] init];
        _lab5.text = @"设置";
        _lab5.font = [UIFont systemFontOfSize:14];
        _lab5.textAlignment = NSTextAlignmentCenter;
    }
    return _lab5;
}

- (UIButton *)btn2{
    if(_btn2 == nil){
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn2.adjustsImageWhenHighlighted = NO;
        [_btn2 setBackgroundImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(log:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}
- (UIButton *)btn1{
    if(_btn1 == nil){
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.adjustsImageWhenHighlighted = NO;
        [_btn1 setBackgroundImage:[UIImage imageNamed:@"zhihu"] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(log:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

- (UIButton *)btn3{
    if(_btn3 == nil){
        _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn3.adjustsImageWhenHighlighted = NO;
        [_btn3 setBackgroundImage:[UIImage imageNamed:@"apple"] forState:UIControlStateNormal];
        [_btn3 addTarget:self action:@selector(log:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn3;
}

- (UIButton *)btn4{
    if(_btn4 == nil){
        _btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn4.adjustsImageWhenHighlighted = NO;
        [_btn4 setBackgroundImage:[UIImage imageNamed:@"夜间"] forState:UIControlStateNormal];
        [_btn4 addTarget:self action:@selector(night:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn4;
}

- (UIButton *)btn5{
    if(_btn5 == nil){
        _btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn5.adjustsImageWhenHighlighted = NO;
        [_btn5 setBackgroundImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    }
    return _btn5;
}

- (UIButton *)btn6{
    if(_btn6 == nil){
        _btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn6.adjustsImageWhenHighlighted = NO;
        [_btn6 setBackgroundImage:[UIImage imageNamed:@"圈圈"] forState:UIControlStateNormal];
        [_btn6 setBackgroundImage:[UIImage imageNamed:@"勾勾"] forState:UIControlStateSelected];
        [_btn6 addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn6;
}
- (UIButton *)btn7{
    if(_btn7 == nil){
        _btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn7.adjustsImageWhenHighlighted = NO;
        [_btn7 setBackgroundImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
        [_btn7 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn7;
}

#pragma mark -click

-(void) back:(UIButton *) backBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) select:(UIButton *) button{
    if(button.isSelected == YES){
        button.selected = NO;
    }else{
        button.selected = YES;
    }
}

-(void) log:(UIButton *) button{
    if(self.btn6.isSelected == NO){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"请阅读并勾选《知乎协议》和《个人信息保护指引》" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *back = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:back];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [self saveTheStatusOfLogin];
        [MainPageViewController log:YES];
        PersonPageViewController *pvc = [[PersonPageViewController alloc] init];
        [self.navigationController pushViewController:pvc animated:YES];
    }
}

-(void) night:(UIButton *) button{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"抱歉" message:@"夜间模式暂未完成...." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *back = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:back];
    [self presentViewController:alert animated:YES completion:nil];
}

//保存登录状态
-(void)saveTheStatusOfLogin{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingString:@"/LoginStatus.plist"];//获取文件的路径
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:path];//根据路径找到plist文件并装入字典
    [dic setObject:@"YES"forKey:@"isLog"];//修改字典的value值
    NSLog(@"%@",path);
    BOOL success = [dic writeToFile:path atomically:YES];//用新的字典覆盖之前的文件
    NSLog(@"%@",path);
    if(success){
        NSLog(@"写入成功");
    }
}

@end
