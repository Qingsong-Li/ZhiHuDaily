//
//  BannerView.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/1/31.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface BannerView : UITableViewHeaderFooterView

@property(nonatomic,strong) UIView *view;

@property(nonatomic,strong) NSTimer *myTimer;

@property(nonatomic,strong) UIPageControl *pageControl;

@property(nonatomic,strong) UICollectionView *collectionView;

@property(copy,nonatomic) NSArray *bannerDataArray;

@end

NS_ASSUME_NONNULL_END
