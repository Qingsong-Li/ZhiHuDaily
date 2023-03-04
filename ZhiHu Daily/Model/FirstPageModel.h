//
//  FirstPageModel.h
//  ZhiHu Daily
//
//  Created by 李青松 on 2023/1/13.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface FirstPageModel : NSObject

@property(nonatomic,copy) NSArray *image;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *hint;
@property(nonatomic,copy) NSString *date;
@property(nonatomic,copy) NSNumber *messageId;



+ (void) getDatawithSuccess:(void (^) (NSArray *array)) success Failure:(void (^) (void)) failure;

+ (void) getDatawithSuccess:(void (^) (NSArray *array)) success Failure:(void (^) (void)) failure Url:(NSString *) url;

+ (instancetype) dataWithDict:(NSDictionary *) dict;


@end

NS_ASSUME_NONNULL_END
