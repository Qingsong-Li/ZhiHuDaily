//
//  DetailPageViewController.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/7.
//

#import "DetailPageViewController.h"
#import "Masonry.h"

@interface DetailPageViewController ()<
WKUIDelegate,
WKNavigationDelegate
>



@end 

@implementation DetailPageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [ExtraModel getDatawithSuccess:^(NSArray * _Nonnull array) {
        self.dataArray = array;
        [self.view addSubview:self.extView];
        [self.extView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(0);
            make.left.mas_offset(0);
            make.width.mas_equalTo(self.view.mas_width).mas_offset(0);
            make.height.mas_offset(80);
        }];
        } Failure:^{
            
        } Url:self.dataUrl] ;
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(50);
        make.left.mas_offset(0);
        make.width.mas_equalTo(self.view.mas_width).mas_offset(0);
        make.height.mas_equalTo(self.view.mas_height).mas_offset(-130);
    }];
    

 
    
    
    // Do any additional setup after loading the view.
}

- (WKWebView *)webView{
    if(_webView == nil){
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.selectionGranularity = WKSelectionGranularityDynamic;
        configuration.allowsInlineMediaPlayback = YES;
                
        WKPreferences *preferences = [WKPreferences new];
        //是否支持JavaScript
        preferences.javaScriptEnabled = YES;
        //不通过用户交互，是否可以打开窗口
        preferences.javaScriptCanOpenWindowsAutomatically = YES;
        configuration.preferences = preferences;
        _webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds configuration:configuration];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        [_webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    }
    return _webView;
}

- (ExtraView *)extView{
    if(_extView == nil){
        _extView = [[ExtraView alloc] init];
        ExtraModel *model = self.dataArray[0];
        _extView.commentNum.text = [NSString stringWithFormat:@"%@",model.comments ];
        _extView.popNum.text = [NSString stringWithFormat:@"%@",model.popularity ];
    }
    return _extView;
}



@end
