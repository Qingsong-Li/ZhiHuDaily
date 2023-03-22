//
//  TopView.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/1/12.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface TopView : UIView

//顶部视图的五个控件;
@property(nonatomic,strong) UILabel *dateLab;
@property(nonatomic,strong) UILabel *monthLab;
@property(nonatomic,strong) UILabel *zhiHuLab;
@property(nonatomic,strong) UIButton *headBtn;
@property(nonatomic,strong) UIImageView *separate;



@end

NS_ASSUME_NONNULL_END
