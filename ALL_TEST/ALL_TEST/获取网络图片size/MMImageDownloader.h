//
//  MMImageDownloader.h
//  ALL_TEST
//
//  Created by qinxinghua on 2021/12/6.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMImageDownloader : NSObject
+(void)downloadImageSizeWithURL:(id)imageURL
                         callback:(void(^)(CGSize size))callback;
@end

NS_ASSUME_NONNULL_END
