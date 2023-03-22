//
//  MainPageViewController.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/18.
//


#import "TopView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainPageViewController : UIViewController
@property(strong,nonatomic) TopView *topView;
@property(strong,nonatomic) UITableView *table;
@property(copy,nonatomic) NSArray *dataArray;
@property(strong,nonatomic) NSMutableArray<NSArray *> *allDataArray;
@property(copy,nonatomic) NSString *pastNewsUrl;
+(void) log:(BOOL) choice;
+(BOOL) isLog ;

@end

NS_ASSUME_NONNULL_END
