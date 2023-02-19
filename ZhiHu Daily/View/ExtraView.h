//
//  ExtraView.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/18.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface ExtraView : UIView

@property(nonatomic,strong) UIButton *commentBtn;
@property(nonatomic,strong) UIButton *popBtn;//点赞按钮
@property(nonatomic,strong) UIButton *collectBtn;  
@property(nonatomic,strong) UIButton *shareBtn;
@property(nonatomic,strong) UIButton *backBtn;
@property(nonatomic,strong) UILabel *commentNum;
@property(nonatomic,strong) UILabel *popNum;
@property(nonatomic,strong) UIImageView *separate;



@end

NS_ASSUME_NONNULL_END
