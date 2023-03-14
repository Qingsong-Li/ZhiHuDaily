//
//  BannerCollectionViewCell.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/3.
//

#import "BannerCollectionViewCell.h"
#import "Masonry.h"

NSString *BannerCollectionViewCellReuseIdentifier = @"BannerCollectionViewCell";

@implementation BannerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self.contentView addSubview:self.image];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.hint];
        
        [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.contentView).mas_offset(0);
        }];
        
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView).mas_offset(270);
            make.left.mas_equalTo(self.contentView).mas_offset(19);
            make.width.mas_equalTo(self.contentView.mas_width).mas_offset(-55);
            make.height.mas_offset(65);
        }];
        
        [self.hint mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.title.mas_bottom).mas_offset(0);
            make.left.mas_equalTo(self.title).mas_offset(0);
            make.width.mas_offset(200);
            make.height.mas_offset(20);
        }];
    }
    return self;
}



#pragma mark -Lazy
- (UIImageView *)image{
    if(_image == nil) {
        _image = [[UIImageView alloc]init];
    }
    return _image;

}
- (UILabel *)title{
    if(_title == nil){
        _title = [[UILabel alloc]init];
        _title.numberOfLines = 2;
        _title.font = [UIFont boldSystemFontOfSize:22];
        _title.textColor = UIColor.whiteColor;
    }
    return _title;
}

- (UILabel *)hint{
    if(_hint == nil){
        _hint = [[UILabel alloc]init];
        _hint.font = [UIFont systemFontOfSize:16];
        _hint.textColor = UIColor.grayColor;
        _hint.alpha = 1;
    }
    return _hint;
}

@end
