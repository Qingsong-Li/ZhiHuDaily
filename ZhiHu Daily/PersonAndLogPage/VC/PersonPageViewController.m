//
//  PersonPageViewController.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/25.
//

#import "PersonPageViewController.h"
#import "MainPageViewController.h"
#import "Masonry.h"

@interface PersonPageViewController ()<
UITableViewDelegate,
UITableViewDataSource

>

@end

@implementation PersonPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.headImg];
    [self.view addSubview:self.idLab];
    [self.view addSubview:self.nightBtn];
    [self.view addSubview:self.nightLab];
    [self.view addSubview:self.setLab];
    [self.view addSubview:self.setBtn];
    [self.view addSubview:self.table];
    [self.view addSubview:self.backBtn];
    
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view).mas_offset(0);
        make.top.mas_equalTo(self.view).mas_offset(100);
        make.size.mas_offset(80);
    }];
    [self.idLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view).mas_offset(0);
        make.top.mas_equalTo(self.headImg.mas_bottom).mas_offset(10);
        make.width.mas_offset(150);
        make.height.mas_offset(30);
    }];
    [self.nightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nightBtn.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(self.nightBtn.mas_centerX).mas_offset(0);
        make.width.mas_offset(65);
        make.height.mas_offset(15);
    }];
    [self.setLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.setBtn.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(self.setBtn.mas_centerX).mas_offset(0);
        make.width.mas_offset(65);
        make.height.mas_offset(15);
    }];
    [self.setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nightBtn).mas_offset(0);
        make.centerX.mas_equalTo(self.view).mas_offset(80);
        make.size.mas_offset(35);
    }];
    [self.nightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-90);
        make.centerX.mas_equalTo(self.view).mas_offset(-80);
        make.size.mas_offset(35);
    }];
    
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.idLab.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(self.view).mas_offset(0);
        make.width.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_offset(200);
    }];
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(70);
        make.left.mas_equalTo(self.view).mas_offset(25);
        make.size.mas_offset(22);
    }];
    
    
}

-(NSArray *) getAry{

    NSArray *ary = [NSArray array];
    ary = @[@"我的收藏",@"消息中心",@"退出登录"];
    return ary;
}

#pragma mark - Lazy

- (UITableView *)table{
    if(_table == nil){
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.scrollEnabled = NO;
    }
    return _table;
}

- (UIImageView *)headImg{
    if(_headImg == nil){
        _headImg = [[UIImageView alloc] init];
        _headImg.image = [UIImage imageNamed:@"headshot"];
    }
    return _headImg;
}

- (UILabel *)idLab{
    if(_idLab == nil){
        _idLab = [[UILabel alloc]init];
        _idLab.text = @"渐渐被遗忘的人";
        _idLab.font = [UIFont boldSystemFontOfSize:20];
        _idLab.textAlignment = NSTextAlignmentCenter;
    }
    return _idLab;
}

- (UIButton *)nightBtn{
    if(_nightBtn == nil){
        _nightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nightBtn.adjustsImageWhenHighlighted = NO;
        [_nightBtn setBackgroundImage:[UIImage imageNamed:@"夜间"] forState:UIControlStateNormal];
        [_nightBtn addTarget:self action:@selector(night:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nightBtn;
}

- (UIButton *)setBtn{
    if(_setBtn == nil){
        _setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _setBtn.adjustsImageWhenHighlighted = NO;
        [_setBtn setBackgroundImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    }
    return _setBtn;
}

- (UIButton *)backBtn{
    if(_backBtn == nil){
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.adjustsImageWhenHighlighted = NO;
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (UILabel *)nightLab{
    if(_nightLab == nil){
        _nightLab = [[UILabel alloc] init];
        _nightLab.text = @"夜间模式";
        _nightLab.font = [UIFont systemFontOfSize:14];
        _nightLab.textAlignment = NSTextAlignmentCenter;
    }
    return _nightLab;
}

- (UILabel *)setLab{
    if(_setLab == nil){
        _setLab = [[UILabel alloc] init];
        _setLab.text = @"设置";
        _setLab.font = [UIFont systemFontOfSize:14];
        _setLab.textAlignment = NSTextAlignmentCenter;
    }
    return _setLab;
}




#pragma mark - UITableViewDataSourse
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;                    
        cell.textLabel.text = [self getAry][indexPath.row];
        if([[self getAry][indexPath.row]  isEqual: @"退出登录"]){
            cell.textLabel.textColor = UIColor.redColor;
        }
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([[self getAry][indexPath.row]  isEqual: @"退出登录"]){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"LoginStatus.plist" ofType:nil];//获取文件的路径
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:path];//根据路径找到plist文件并装入字典
        [dic setObject:@"NO"forKey:@"isLog"];//修改字典的value值
        NSLog(@"%@",path);
        BOOL success = [dic writeToFile:path atomically:YES];//用新的字典覆盖之前的文件
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];//检验收否写入成功，重新获取一遍，发现获取的值确实为修改后的值
        NSLog(@"%@",path);
        if(success){
            NSLog(@"写入成功");
        }
        [MainPageViewController log:NO];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}




#pragma mark - Click
-(void) night:(UIButton *) button{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"抱歉" message:@"夜间模式暂未完成...." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *back = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:back];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) back:(UIButton *) backBtn{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
