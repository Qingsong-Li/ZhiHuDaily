//
//  BannerCollectionViewCell.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN NSString *BannerCollectionViewCellReuseIdentifier;

@interface BannerCollectionViewCell : UICollectionViewCell

@property(strong,nonatomic) UIImageView *image;
@property(strong,nonatomic) UILabel *title;
@property(strong,nonatomic) UILabel *hint;

@end

NS_ASSUME_NONNULL_END
