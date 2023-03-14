//
//  PersonPageViewController.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonPageViewController : UIViewController

@property(strong,nonatomic) UIImageView *headImg;
@property(strong,nonatomic) UILabel *idLab;
@property(strong,nonatomic) UILabel *nightLab;
@property(strong,nonatomic) UILabel *setLab;
@property(strong,nonatomic) UITableView *table;
@property(strong,nonatomic) UIButton *nightBtn;
@property(strong,nonatomic) UIButton *setBtn;
@property(strong,nonatomic) UIButton *backBtn;

@end

NS_ASSUME_NONNULL_END
