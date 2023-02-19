//
//  BannerModel.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/3.
//

#import "BannerModel.h"
#import "AFHTTPSessionManager.h"

@implementation BannerModel

+ (instancetype)dataWithDict:(NSDictionary *)dict{
    BannerModel *model = [[BannerModel alloc] init];
    model.image = dict[@"image"];
    model.url = dict[@"url"];
    model.hint = dict[@"hint"];
    model.title = dict[@"title"];
    model.messageId = dict[@"id"];
    return model;
}

+ (void)getDatawithSuccess:(void (^)(NSArray * _Nonnull))success Failure:(void (^)(void))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://news-at.zhihu.com/api/3/news/latest" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSMutableArray *mArray = [NSMutableArray array];
        for(NSDictionary *dict in responseObject[@"top_stories"]){
            BannerModel *model = [BannerModel dataWithDict:dict];
            [mArray addObject:model];
            NSLog(@"Success");
        }if(success) success(mArray.copy);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error");
        }];
}

@end
