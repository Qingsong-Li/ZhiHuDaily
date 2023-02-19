//
//  ExtraModel.m
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/19.
//

#import "ExtraModel.h"
#import "AFHTTPSessionManager.h"

@implementation ExtraModel

+ (instancetype)dataWithDict:(NSDictionary *)dict{
    ExtraModel *dataModel = [[ExtraModel alloc]init];
    
        dataModel.comments = dict[@"comments"];
        dataModel.popularity = dict[@"popularity"];
    
    
    return dataModel;
}

+ (void)getDatawithSuccess:(void (^)(NSArray * _Nonnull))success Failure:(void (^)(void))failure Url:(NSString *)url{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",[responseObject class]);
        NSMutableArray *mArray = [NSMutableArray array];
            ExtraModel *model = [ExtraModel dataWithDict:responseObject];
        [mArray addObject:model];
        if(success) success(mArray.copy);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
}


@end
