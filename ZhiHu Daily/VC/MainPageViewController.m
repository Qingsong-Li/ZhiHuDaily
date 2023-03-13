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
UICollectionViewDataSource,
UIScrollViewDelegate
>




@end

@implementation MainPageViewController

static BOOL loging;

+(void)log:(BOOL)choice{
    loging = choice;
}
+ (BOOL)isLog{
    return loging;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.topView];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(55);
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.width.mas_equalTo(self.view.mas_width).mas_offset(0);
        make.height.mas_offset(55);
    }];
    
    
    [FirstPageModel getDatawithSuccess:^(NSArray * _Nonnull array) {
        self.dataArray = [NSMutableArray arrayWithArray:array];
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
    return self.dataArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}



#pragma mark -UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstPageModel *dataModel  = self.dataArray[indexPath.row];
    //复用机制
//    static NSString *cellId = @"cellId";
//    FirstPageTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:cellId];
//    if(firstCell == nil){
//        firstCell = [[FirstPageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
//        firstCell.title.text = dataModel.title;
//        firstCell.hint.text = dataModel.hint;
//        [firstCell.image sd_setImageWithURL:[NSURL URLWithString:[dataModel.image objectAtIndex:0]]];
//
//    }
    FirstPageTableViewCell *firstCell = [[FirstPageTableViewCell alloc] init];
    firstCell.title.text = dataModel.title;
    firstCell.hint.text = dataModel.hint;
    [firstCell.image sd_setImageWithURL:[NSURL URLWithString:[dataModel.image objectAtIndex:0]]];
    return firstCell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    FirstPageModel *dataModel  = self.dataArray[indexPath.row % 6];
    DetailPageViewController *dvc = [[DetailPageViewController alloc]init];
    dvc.url = [NSURL URLWithString:dataModel.url];
    dvc.dataUrl= [NSString stringWithFormat:@"https://news-at.zhihu.com/api/3/story-extra/%@",dataModel.messageId];
    [self.navigationController pushViewController:dvc animated:YES];
    
}

#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    CGFloat scrollViewHeight = bounds.size.height;
    CGFloat currentOffset = offset.y + scrollViewHeight - inset.bottom;
    CGFloat maximumOffset = size.height;
    
    CGFloat minSpace = 5;
    CGFloat maxSpace = 10;
    bool isNeedLoadMore = false;
    //上拉加载更多
    //tableview 的 content的高度 小于 tableview的高度
    if(scrollViewHeight>=maximumOffset){
        CGFloat space = currentOffset - scrollViewHeight;
        if(space>minSpace && space <maxSpace){
            isNeedLoadMore = true;
        }
    }else{
        //当currentOffset与maximumOffset的值相差很小时，说明scrollview已经滑到底部了。
        CGFloat space = currentOffset - maximumOffset;
        if(space>minSpace && space <maxSpace){
            isNeedLoadMore = true;
        }
    }
    
    if(!self.isLoading && isNeedLoadMore){
        self.isLoading = true;
        NSLog(@"-->加载更多数据");
        [self loadMore];
        self.isLoading = false;
    }
}

-(void) loadMore{
    
    FirstPageModel *dataModel  = self.dataArray[self.dataArray.count-1];
    self.pastNewsUrl = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/3/stories/before/%@", [NSString stringWithFormat:@"%d",[dataModel.date intValue]]];
    [FirstPageModel getDatawithSuccess:^(NSArray * _Nonnull array) {
        [self.dataArray addObjectsFromArray:array];
        [self.table reloadData];
    
    } Failure:^{
            NSLog(@"请求失败");
        } Url:self.pastNewsUrl] ;
    
    
}


@end
