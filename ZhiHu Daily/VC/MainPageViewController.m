//
//  MainPageViewController.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/18.
//

#import "MainPageViewController.h"
#import "ViewController.h"
#import "TopView.h"
#import "FirstPageModel.h"
#import "FirstPageTableViewCell.h"
#import "UIimageView+WebCache.h"
#import "BannerView.h"
#import "BannerModel.h"
#import "BannerCollectionViewCell.h"
#import "DetailPageViewController.h"


@interface MainPageViewController ()<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property(strong,nonatomic) TopView *topView;
@property(strong,nonatomic) UITableView *table;
@property(copy,nonatomic) NSArray *dataArray;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.topView];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(55);
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.width.mas_equalTo(self.view.mas_width).mas_offset(0);
        make.height.mas_offset(55);
    }];
    
    
    [FirstPageModel getDatawithSuccess:^(NSArray * _Nonnull array) {
        self.dataArray = array;
        NSLog(@"%@",self.dataArray);
        [self.view addSubview:self.table];
        [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topView.mas_bottom).mas_offset(0);
            make.left.mas_equalTo(self.view).mas_offset(0);
            make.width.mas_equalTo(self.view).mas_offset(0);
            make.height.mas_equalTo(self.view).mas_offset(-55);
        }];
        } Failure:^{
            NSLog(@"请求失败");
        }];
    
    

    
   
    // Do any additional setup after loading the view.
}

#pragma mark -Lazy

- (TopView *)topView{
    if(_topView == nil){
        _topView = [[TopView alloc] init];
    }
    return _topView;
}

- (UITableView *)table{
    if(_table == nil){
        _table = [[UITableView alloc]init];
        _table.delegate = self;
        _table.dataSource = self;
        _table.contentInset = UIEdgeInsetsMake(385, 0, 0, 0);
        
        
        BannerView *bannerView = [[BannerView alloc] init];
        bannerView.backgroundColor = UIColor.redColor;
        [_table addSubview:bannerView];
        [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(-385);
            make.left.mas_equalTo(self.table).mas_offset(0);
            make.width.mas_equalTo(self.table).mas_offset(0);
            make.height.mas_offset(385);
        }];
        
        
      
    }
    return _table;
}


#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%zd",self.dataArray.count);
    return self.dataArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

#pragma mark -UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstPageModel *dataModel  = self.dataArray[indexPath.row];
    //复用机制
    static NSString *cellId = @"cellId";
    FirstPageTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(firstCell == nil){
        firstCell = [[FirstPageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        firstCell.title.text = dataModel.title;
        firstCell.hint.text = dataModel.hint;
        [firstCell.image sd_setImageWithURL:[NSURL URLWithString:[dataModel.image objectAtIndex:0]]];
        
    }
    return firstCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    FirstPageModel *dataModel  = self.dataArray[indexPath.row];
    DetailPageViewController *dvc = [[DetailPageViewController alloc]init];
    dvc.url = [NSURL URLWithString:dataModel.url];
    dvc.dataUrl= [NSString stringWithFormat:@"https://news-at.zhihu.com/api/3/story-extra/%@",dataModel.messageId];
    [self.navigationController pushViewController:dvc animated:YES];
    
}

@end
