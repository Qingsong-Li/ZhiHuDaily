//
//  DateSeparateView.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/3/13.
//

#import "DateSeparateView.h"
NSString *TableViewHeaderViewReuseIdentifier = @"TableViewHeaderView";

@implementation DateSeparateView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UIColor.whiteColor;
        [self.contentView addSubview:self.dateSeparate];
        [self.contentView addSubview:self.dateLab];
        
        [self.dateSeparate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY).mas_offset(0);
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(0);
            make.height.mas_equalTo(self.contentView.mas_height).mas_offset(0);
            make.width.mas_equalTo(self.contentView.mas_width).mas_offset(-70);
        }];
        [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY).mas_offset(0);
            make.left.mas_equalTo(self.contentView.mas_left).mas_offset(0);
            make.height.mas_equalTo(self.contentView.mas_height).mas_offset(0);
            make.width.mas_offset(80);
        }];
    }
    return self;
}

- (UILabel *)dateLab{
    if(_dateLab == nil){
        _dateLab = [[UILabel alloc]init];
        _dateLab.textColor = UIColor.grayColor;
        _dateLab.font = [UIFont boldSystemFontOfSize:14];
        _dateLab.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLab;
}

- (UIImageView *)dateSeparate{
    if(_dateSeparate == nil){
        _dateSeparate = [[UIImageView alloc]init];
        _dateSeparate.image = [UIImage imageNamed:@"dateseparate"];
    }
    return _dateSeparate;
}

@end
