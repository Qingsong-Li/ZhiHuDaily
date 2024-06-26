//
//  BannerView.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/1/31.
//

#import "BannerView.h"
#import "BannerCollectionViewCell.h"
#import "Masonry.h"
#import "BannerModel.h"
#import "UIimageView+WebCache.h"
#import "DetailPageViewController.h"


@interface BannerView ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@end

@implementation BannerView

#pragma mark -Lazy


-(UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        //创建布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //行距
        layout.minimumLineSpacing = 0;
        //每一列的距离
        layout.minimumInteritemSpacing = 0;
        //布局滚动的方向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        //创建UICollectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        //是否分页
        _collectionView.pagingEnabled = YES;
        //水平和竖直方向是否显示滚动条
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:BannerCollectionViewCell.class forCellWithReuseIdentifier:BannerCollectionViewCellReuseIdentifier];
        _collectionView.backgroundColor = UIColor.whiteColor;
    }
    return _collectionView;
}

- (instancetype)init{
    self = [super init];
    if(self){
        [BannerModel getDatawithSuccess:^(NSArray * _Nonnull array) {
            self.bannerDataArray = array;
            [self addSubview:self.collectionView];
            [self addSubview:self.pageControl];
            [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self).mas_offset(-5);
                make.right.mas_equalTo(self).mas_offset(30);
                make.width.mas_offset(200);
                make.height.mas_offset(25);
            }];
            [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self).mas_offset(0);
                make.left.mas_equalTo(self).mas_offset(0);
                make.width.mas_equalTo(self).mas_offset(0);
                make.height.mas_equalTo(self).mas_offset(0);
            }];
            } Failure:^{
                NSLog(@"请求失败");
            }];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.pageControl.numberOfPages = 5;
        [self myTimer];
        
    };
 
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
//
#pragma mark - UICollectionViewDataSourse

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

#pragma mark -UICollectionDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    BannerModel *dataModel  = self.bannerDataArray[indexPath.row];
    DetailPageViewController *dvc = [[DetailPageViewController alloc]init];
    dvc.url = [NSURL URLWithString:dataModel.url];
    dvc.dataUrl= [NSString stringWithFormat:@"https://news-at.zhihu.com/api/3/story-extra/%@",dataModel.messageId];
    [[self viewController].navigationController pushViewController:dvc animated:YES];
}


#pragma mark -UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.frame.size;
}

    
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BannerModel *bannerDataModel  = self.bannerDataArray[indexPath.item% 5 ];
    BannerCollectionViewCell *bannerCell = [collectionView dequeueReusableCellWithReuseIdentifier:BannerCollectionViewCellReuseIdentifier forIndexPath:indexPath];
    bannerCell.title.text = bannerDataModel.title;
    bannerCell.hint.text = bannerDataModel.hint;
    [bannerCell.image sd_setImageWithURL:[NSURL URLWithString:bannerDataModel.image]];
    
        return bannerCell;
    }

#pragma mark - ScrollViewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.myTimer invalidate];
    self.myTimer = nil;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"stop");
    [self myTimer];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    page第一个点是0
    NSInteger currentPage = (self.collectionView.contentOffset.x + self.collectionView.bounds.size.width * 0.5)/self.collectionView.bounds.size.width;
    if(currentPage == 5){
        currentPage = 0;
    }
    self.pageControl.currentPage = currentPage;
}

-(NSTimer *)myTimer
{
    if (_myTimer == nil) {
        _myTimer = [NSTimer scheduledTimerWithTimeInterval:1.2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_myTimer forMode:NSRunLoopCommonModes];
    }
    return _myTimer;
}

-(UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.alpha = 1;
    }
    return _pageControl;
}

//自动到下一页
-(void)nextPage
{
    NSInteger currentPage = self.pageControl.currentPage;
//    NSLog(@"%ld",(long)currentPage);
    if((long)[[self.collectionView indexPathsForVisibleItems] firstObject].section == 1){
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
    if(currentPage == 4){
        currentPage = 0;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:currentPage inSection:1] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }else{
        currentPage ++;
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:currentPage inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    
}
@end
