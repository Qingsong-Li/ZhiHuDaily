//
//  MainPageViewController.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/18.
//

#import "ViewController.h"
#import "TopView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainPageViewController : ViewController
@property(strong,nonatomic) TopView *topView;
@property(strong,nonatomic) UITableView *table;
@property(copy,nonatomic) NSArray *dataArray;
@property(copy,nonatomic) NSString *pastNewsUrl;
@property(nonatomic) BOOL isLoading;
@property(nonatomic) NSInteger numberOfRow;
+(void) log:(BOOL) choice;
+(BOOL) isLog ;

@end

NS_ASSUME_NONNULL_END
