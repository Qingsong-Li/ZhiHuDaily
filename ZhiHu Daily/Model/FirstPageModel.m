//
//  FirstPageModel.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/1/13.
//

#import "FirstPageModel.h"
#import "AFHTTPSessionManager.h"

@implementation FirstPageModel

+ (instancetype)dataWithDict:(NSDictionary *)dict{
    FirstPageModel *model = [[FirstPageModel alloc] init];
    model.image = dict[@"images"];
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
        for(NSDictionary *dict in responseObject[@"stories"]){
            FirstPageModel *model = [FirstPageModel dataWithDict:dict];
            model.date = responseObject[@"date"];
            [mArray addObject:model];
            NSLog(@"Success");
        }
        
        if(success) success(mArray.copy);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error1");
        }];
}

+ (void)getDatawithSuccess:(void (^)(NSArray * _Nonnull))success Failure:(void (^)(void))failure Url:(NSString *)url{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSMutableArray *mArray = [NSMutableArray array];
        for(NSDictionary *dict in responseObject[@"stories"]){
            FirstPageModel *model = [FirstPageModel dataWithDict:dict];
            model.date = responseObject[@"date"];
            [mArray addObject:model];
            NSLog(@"Success");
        }
        
        if(success) success(mArray.copy);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
        }];
}

@end


