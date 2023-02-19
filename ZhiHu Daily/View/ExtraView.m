//
//  ExtraView.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/18.
//

#import "ExtraView.h"
#import "Masonry.h"

@implementation ExtraView

- (instancetype)init{
    self = [super init];
    if(self){
        self.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
        [self addSubview:self.commentBtn];
        [self addSubview:self.popBtn];
        [self addSubview:self.collectBtn];
        [self addSubview:self.shareBtn];
        [self addSubview:self.backBtn];
        [self addSubview:self.commentNum];
        [self addSubview:self.popNum];
        [self addSubview:self.separate];
        
        [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).mas_offset(15);
            make.left.mas_equalTo(self).mas_offset(18);
            make.height.mas_equalTo(self.mas_height).mas_offset(-60);
            make.width.mas_equalTo(self.backBtn.mas_height).mas_offset(0);
        }];
        
        [self.separate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.backBtn.mas_top).mas_offset(-5);
            make.left.mas_equalTo(self.backBtn).mas_offset(24);
            make.size.mas_equalTo(self.backBtn).mas_offset(8);
        }];
        
        [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.backBtn.mas_top).mas_offset(-2);
            make.left.mas_equalTo(self.separate).mas_offset(28);
            make.size.mas_equalTo(self.backBtn).mas_offset(3);
        }];
        
        [self.commentNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.commentBtn.mas_top).mas_offset(-2);
            make.left.mas_equalTo(self.commentBtn.mas_right).mas_offset(0);
            make.height.mas_offset(14);
            make.width.mas_offset(20);
        }];
        
        [self.popBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.backBtn.mas_top).mas_offset(-2);
            make.left.mas_equalTo(self.commentBtn).mas_offset(90);
            make.size.mas_equalTo(self.backBtn).mas_offset(3);
        }];
        
        [self.popNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.popBtn.mas_top).mas_offset(-2);
            make.left.mas_equalTo(self.popBtn.mas_right).mas_offset(0);
            make.height.mas_offset(14);
            make.width.mas_offset(20);
        }];
        
        [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.backBtn.mas_top).mas_offset(-2);
            make.left.mas_equalTo(self.popBtn).mas_offset(90);
            make.size.mas_equalTo(self.backBtn).mas_offset(3);
        }];
        
        [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.backBtn.mas_top).mas_offset(-2);
            make.left.mas_equalTo(self.collectBtn).mas_offset(90);
            make.size.mas_equalTo(self.backBtn).mas_offset(3);
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
#pragma mark -Lazy

- (UIButton *)commentBtn{
    if(_commentBtn == nil){
        _commentBtn = [[UIButton alloc] init];
        [_commentBtn setBackgroundImage:[UIImage imageNamed:@"commentBtn"] forState:UIControlStateNormal];
        [_commentBtn addTarget:self action:@selector(comment:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _commentBtn;
}

- (UIButton *)backBtn{
    if(_backBtn == nil){
        _backBtn = [[UIButton alloc] init];
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (UIImageView *)separate{
    if(_separate == nil){
        _separate = [[UIImageView alloc] init];
        _separate.image = [UIImage imageNamed:@"separate1"];
    }
    return _separate;
}

- (UIButton *)popBtn{
    if(_popBtn == nil){
        _popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_popBtn setBackgroundImage:[UIImage imageNamed:@"popBtn"] forState:UIControlStateNormal];
        [_popBtn setBackgroundImage:[UIImage imageNamed:@"selectedPopBtn"] forState:UIControlStateSelected];
        [_popBtn addTarget:self action:@selector(like:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popBtn;
}

- (UIButton *)collectBtn{
    if(_collectBtn== nil){
        _collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectBtn setBackgroundImage:[UIImage imageNamed:@"collectBtn"] forState:UIControlStateNormal];
        [_collectBtn setBackgroundImage:[UIImage imageNamed:@"selectedCollectBtn"] forState:UIControlStateSelected];
        [_collectBtn addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectBtn;
}

- (UIButton *)shareBtn{
    if(_shareBtn == nil){
        _shareBtn = [[UIButton alloc] init];
        [_shareBtn setBackgroundImage:[UIImage imageNamed:@"shareBtn"] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}

- (UILabel *)commentNum{
    if(_commentNum == nil){
        _commentNum = [[UILabel alloc]init];
        _commentNum.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
        _commentNum.font = [UIFont systemFontOfSize:10];
        _commentNum.textAlignment = NSTextAlignmentCenter;
    }
    return _commentNum;
}
- (UILabel *)popNum{
    if(_popNum == nil){
        _popNum = [[UILabel alloc] init];
        _popNum.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
        _popNum.font = [UIFont systemFontOfSize:10];
        _popNum.textAlignment = NSTextAlignmentCenter;
    }
    return _popNum;
}


#pragma mark -Click
-(void) back:(UIButton *) backBtn{
    [[self viewController].navigationController popViewControllerAnimated:YES];
}

-(void) like:(UIButton *) popBtn{
    if(popBtn.selected == YES){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"取消点赞" preferredStyle:UIAlertControllerStyleAlert];
        [[self viewController] presentViewController:alert animated:YES completion:nil];
        [alert dismissViewControllerAnimated:YES completion:nil];
        popBtn.selected = NO;
        int a = [self.popNum.text intValue];
        a--;
        self.popNum.text = [NSString stringWithFormat:@"%d",a];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"点赞成功" preferredStyle:UIAlertControllerStyleAlert];
        [[self viewController] presentViewController:alert animated:YES completion:nil];
        [alert dismissViewControllerAnimated:YES completion:nil];
        popBtn.selected = YES;
        int a = [self.popNum.text intValue];
        a++;
        self.popNum.text = [NSString stringWithFormat:@"%d",a];
    }
}

-(void) collect:(UIButton *)collectBtn{
    if(collectBtn.selected == YES){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"取消收藏" preferredStyle:UIAlertControllerStyleAlert];
        [[self viewController] presentViewController:alert animated:YES completion:nil];
        
        [alert dismissViewControllerAnimated:YES completion:nil];
        collectBtn.selected = NO;
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"收藏成功" preferredStyle:UIAlertControllerStyleAlert];
        [[self viewController] presentViewController:alert animated:YES completion:nil];
        [alert dismissViewControllerAnimated:YES completion:nil];
        collectBtn.selected = YES;
    }
}

-(void) share:(UIButton *)shareBtn{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"抱歉" message:@"分享功能完善中..." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *back = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:back];
    [[self viewController] presentViewController:alert animated:YES completion:nil];
}

-(void) comment:(UIButton *)commentBtn{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"抱歉" message:@"评论功能完善中..." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *back = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:back];
    [[self viewController] presentViewController:alert animated:YES completion:nil];
}
@end
