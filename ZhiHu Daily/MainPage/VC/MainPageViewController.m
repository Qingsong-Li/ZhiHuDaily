//
//  MainPageViewController.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/18.
//

#import "MainPageViewController.h"
#import "TopView.h"
#import "FirstPageModel.h"
#import "FirstPageTableViewCell.h"
#import "UIimageView+WebCache.h"
#import "BannerView.h"
#import "BannerModel.h"
#import "BannerCollectionViewCell.h"
#import "DetailPageViewController.h"
#import "DateSeparateView.h"



@interface MainPageViewController ()<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource,
UIScrollViewDelegate
>
@property(nonatomic,getter=isloading,assign) BOOL loading;


@end

@implementation MainPageViewController

static BOOL loging;

+(void)log:(BOOL)choice{
    loging = choice;
}
+ (BOOL)isLog{
    return loging;
}

-(void)getLoginStatus{
//    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"LoginStatus" ofType:@"plist"];
//    NSString *path2 = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:nil];
//    NSString *lastPath = [[NSBundle mainBundle] pathForResource:@"LoginStatus.plsit" ofType:nil];
//    NSLog(@"%@",lastPath);
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingString:@"/LoginStatus.plist"];
    NSLog(@"%@",path);
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    if(dic == nil){
        dic = @{@"islog":@"NO"};
        [dic writeToFile:path atomically:YES];
    }
    if([dic[@"isLog"]  isEqual: @"YES"]){
        loging = YES;
    }else{
        loging = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getLoginStatus];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = UIColor.whiteColor;
//    [self.view addSubview:self.topView];
//
//    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.view).mas_offset(55);
//        make.left.mas_equalTo(self.view).mas_offset(0);
//        make.width.mas_equalTo(self.view.mas_width).mas_offset(0);
//        make.height.mas_offset(55);
//    }];
    
    
    [FirstPageModel getDatawithSuccess:^(NSArray * _Nonnull array) {
        self.dataArray = array;
        [self.allDataArray addObject:self.dataArray];
        NSLog(@"%@",self.dataArray);
        [self.view addSubview:self.table];
        [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).mas_offset(110);
            make.left.mas_equalTo(self.view).mas_offset(0);
            make.width.mas_equalTo(self.view).mas_offset(0);
            make.height.mas_equalTo(self.view).mas_offset(-55);
        }];
        } Failure:^{
            NSLog(@"请求失败");
        }];
    
   
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    TopView *newTopView = [[TopView alloc]init];
    [self.view addSubview:newTopView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backToTop)];
    [newTopView addGestureRecognizer:tapGesture];
    [newTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(55);
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.width.mas_equalTo(self.view.mas_width).mas_offset(0);
        make.height.mas_offset(55);
    }];
}



#pragma mark -Lazy

- (NSMutableArray<NSArray *> *)allDataArray{
    if(_allDataArray == nil){
        _allDataArray = [[NSMutableArray alloc]init];
    }
    return _allDataArray;
}


- (TopView *)topView{
    if(_topView == nil ){
        _topView = [[TopView alloc] init];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backToTop)];
        [_topView addGestureRecognizer:tapGesture];
    }
    return _topView;
}

- (UITableView *)table{
    if(_table == nil){
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _table.showsVerticalScrollIndicator = NO;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.delegate = self;
        _table.dataSource = self;
        _table.estimatedSectionFooterHeight = 0;
        _table.estimatedSectionHeaderHeight = 0;
    }
    return _table;
}


#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allDataArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        BannerView *bannerView = [[BannerView alloc] init];
        return bannerView;
    }else {
        DateSeparateView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:TableViewHeaderViewReuseIdentifier];
        if (headerView == nil) {
            headerView = [[DateSeparateView alloc] initWithReuseIdentifier:TableViewHeaderViewReuseIdentifier];
        }
        FirstPageModel *model = [[FirstPageModel alloc]init];
        model = self.allDataArray[section][0];
        NSString *month = [model.date substringWithRange:NSMakeRange(4, 2)];
        NSString *date = [model.date substringWithRange:NSMakeRange(6, 2)];
        headerView.dateLab.text= [NSString stringWithFormat:@"%ld月%ld日",[month integerValue],[date integerValue]];
        return headerView;
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 385;
    }else{
        return 20;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.allDataArray[section].count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    FirstPageModel *dataModel = self.allDataArray[indexPath.section][indexPath.row];
    //复用机制
    FirstPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier];
    if(cell == nil){
        cell = [[FirstPageTableViewCell alloc] init];
        cell.title.text = dataModel.title;
//        CGSize size = [cell.title sizeThatFits:CGSizeMake(200, MAXFLOAT)];
//        cell.title.frame = CGRectMake(0, 0, 0, size.height);
        [cell.title sizeToFit];
        cell.hint.text = dataModel.hint;
        [cell.image sd_setImageWithURL:[NSURL URLWithString:[dataModel.image objectAtIndex:0]]];
    }
    return cell;
//
}





#pragma mark -UITableViewDelegate



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    FirstPageModel *dataModel  = self.allDataArray[indexPath.section][indexPath.row];
    DetailPageViewController *dvc = [[DetailPageViewController alloc]init];
    dvc.url = [NSURL URLWithString:dataModel.url];
    dvc.dataUrl= [NSString stringWithFormat:@"https://news-at.zhihu.com/api/3/story-extra/%@",dataModel.messageId];
    [self.navigationController pushViewController:dvc animated:YES];
    
}

#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentYoffset = scrollView.contentOffset.y;
    NSLog(@"内容-偏移量:%f table高度:%f",scrollView.contentSize.height-contentYoffset,self.table.frame.size.height);
    if(self.table.frame.size.height == 0 ||scrollView.contentSize.height-contentYoffset<700) return;
    if(self.isloading == YES) return;
    if (scrollView.contentSize.height-contentYoffset- 200<= self.table.frame.size.height) {
        [self loadMore];
        self.loading = YES;
    }
    
    if(scrollView.contentOffset.y < 0){
        [self pullDownScrollScaleWithScrollView:scrollView];
    }
}

- (void)pullDownScrollScaleWithScrollView:(UIScrollView *)scrollView{

}
    


-(void) loadMore{
    FirstPageModel *dataModel  = self.allDataArray[self.allDataArray.count-1][0];
    self.pastNewsUrl = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/3/stories/before/%@", [NSString stringWithFormat:@"%d",[dataModel.date intValue]]];
    [FirstPageModel getDatawithSuccess:^(NSArray * _Nonnull array) {
        self.dataArray = array;
        [self.allDataArray addObject:self.dataArray];
        NSLog(@"loadmore");
        [self.table reloadData];
        self.loading = NO;
    } Failure:^{
            NSLog(@"请求失败");
        } Url:self.pastNewsUrl] ;
    
   
}


//用于点击顶部试图TableView回到顶端
-(void)backToTop{
    [self.table scrollRectToVisible:CGRectMake(0, 0, 0.1, 0.1) animated:YES];
}


@end
