//
//  FirstPageTableViewCell.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/1/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//复用标识
UIKIT_EXTERN NSString *CellReuseIdentifier;

@interface FirstPageTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UILabel *hint;
@property(nonatomic,strong) UIImageView *image;

@end

NS_ASSUME_NONNULL_END
