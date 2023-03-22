//
//  DateSeparateView.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/3/13.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

/// 复用标志
UIKIT_EXTERN NSString *TableViewHeaderViewReuseIdentifier;

@interface DateSeparateView : UITableViewHeaderFooterView

@property(nonatomic,strong) UIImageView *dateSeparate;
@property(nonatomic,strong) UILabel *dateLab;

@end

NS_ASSUME_NONNULL_END
