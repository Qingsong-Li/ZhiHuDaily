//
//  ExtraModel.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/2/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExtraModel : NSObject

@property(nonatomic,assign) NSNumber *comments;
@property(nonatomic,assign) NSNumber *popularity;

+ (void) getDatawithSuccess:(void (^) (NSArray *array)) success Failure:(void (^) (void)) failure Url:(NSString *)url;

+ (instancetype) dataWithDict:(NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
