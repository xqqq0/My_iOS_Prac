//
//  MMImageDownloader.m
//  ALL_TEST
//
//  Created by qinxinghua on 2021/12/6.
//

#import "MMImageDownloader.h"
#import "SDImageCache.h"

@implementation MMImageDownloader
//类方法 传入图片url  返回图片size
+(void)downloadImageSizeWithURL:(id)imageURL
                         callback:(void(^)(CGSize size))callback {
    NSURL* URL = nil;
    //判断url类型
    if([imageURL isKindOfClass:[NSURL class]]){
        URL = imageURL;
    }
    if([imageURL isKindOfClass:[NSString class]]){
        URL = [NSURL URLWithString:imageURL];
    }
    if(URL == nil) {
        callback(CGSizeZero);
    }
    
    NSString* absoluteString = URL.absoluteString;
    //通过SDWebimage 查看图片是否已有缓存，如果有直接获取，如果没有，请求文件头
    if([[SDImageCache sharedImageCache] diskImageDataExistsWithKey:absoluteString]){
        UIImage* image = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:absoluteString];
        if(!image){
            NSData* data = [[SDImageCache sharedImageCache] performSelector:@selector(diskImageDataBySearchingAllPathsForKey:) withObject:URL.absoluteString];
            image = [UIImage imageWithData:data];
        }
        if(!image)
        {
            callback(image.size);
        }
    }
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString* pathExtendsion = [URL.pathExtension lowercaseString];
    __block CGSize size = CGSizeZero;
    __weak __typeof(&*self)weakSelf = self;
    //区分加载图片的类型
    if([pathExtendsion isEqualToString:@"png"]){
        [self downloadPNGImageSizeWithRequest:request callback:^(CGSize imageSize) {
            size = imageSize;
            [weakSelf imageSizeCallback:size url:URL callback:callback];
        }];
    }else if([pathExtendsion isEqual:@"gif"]){
        [self downloadGIFImageSizeWithRequest:request callback:^(CGSize imageSize) {
            [weakSelf imageSizeCallback:imageSize url:URL callback:callback];
        }];
    }else{
        [self downloadJPGImageSizeWithRequest:request callback:^(CGSize imageSize) {
            if(CGSizeEqualToSize(CGSizeZero, size)){
                NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:URL]completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    UIImage* image = [UIImage imageWithData:data];
                    if(image){
                        [[SDImageCache sharedImageCache] storeImage:image imageData:data forKey:URL.absoluteString toDisk:YES completion:^{
                            callback(image.size);
                        }];
                    }
                }];
                [task resume];
            } else {
                callback(size);
            }
        }];
    }
    
}


+ (void)imageSizeCallback:(CGSize)size
                      url:(NSURL *)url
                 callback:(void(^)(CGSize size))callback {
    callback(size);
//    if(CGSizeEqualToSize(CGSizeZero, size)){
//        [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:url]completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//            UIImage* image = [UIImage imageWithData:data];
//            if(image){
//                [[SDImageCache sharedImageCache] storeImage:image imageData:data forKey:url.absoluteString toDisk:YES completion:^{
//                }];
//                callback(size);
//            }
//        }];
//    } else {
//        callback(size);
//    }
}


//PNG格式的图片
+(void)downloadPNGImageSizeWithRequest:(NSMutableURLRequest*)request
                                callback:(void(^)(CGSize size))callback
{
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data.length == 8)
        {
            int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
            [data getBytes:&w1 range:NSMakeRange(0, 1)];
            [data getBytes:&w2 range:NSMakeRange(1, 1)];
            [data getBytes:&w3 range:NSMakeRange(2, 1)];
            [data getBytes:&w4 range:NSMakeRange(3, 1)];
            int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
            int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
            [data getBytes:&h1 range:NSMakeRange(4, 1)];
            [data getBytes:&h2 range:NSMakeRange(5, 1)];
            [data getBytes:&h3 range:NSMakeRange(6, 1)];
            [data getBytes:&h4 range:NSMakeRange(7, 1)];
            int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
            callback(CGSizeMake(w, h));
        } else {
            callback(CGSizeZero);
        }
            
    }];
    [task resume];
}

//GIF格式
+(void)downloadGIFImageSizeWithRequest:(NSMutableURLRequest*)request
                                callback:(void(^)(CGSize size))callback
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data.length == 4)
        {
            short w1 = 0, w2 = 0;
            [data getBytes:&w1 range:NSMakeRange(0, 1)];
            [data getBytes:&w2 range:NSMakeRange(1, 1)];
            short w = w1 + (w2 << 8);
            short h1 = 0, h2 = 0;
            [data getBytes:&h1 range:NSMakeRange(2, 1)];
            [data getBytes:&h2 range:NSMakeRange(3, 1)];
            short h = h1 + (h2 << 8);
            callback(CGSizeMake(w, h));
        } else {
            callback(CGSizeZero);
        }
    }];
    [task resume];
}

//JPG格式
+(void)downloadJPGImageSizeWithRequest:(NSMutableURLRequest*)request
                                callback:(void(^)(CGSize size))callback {
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if ([data length] <= 0x58) {
            callback(CGSizeZero);
        }
        
        if ([data length] < 210) {// 肯定只有一个DQT字段
            short w1 = 0, w2 = 0;
            [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
            [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
            short w = (w1 << 8) + w2;
            short h1 = 0, h2 = 0;
            [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
            [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
            short h = (h1 << 8) + h2;
            callback(CGSizeMake(w, h));
        } else {
            short word = 0x0;
            [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
            if (word == 0xdb) {
                [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
                if (word == 0xdb) {// 两个DQT字段
                    short w1 = 0, w2 = 0;
                    [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                    [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                    short w = (w1 << 8) + w2;
                    short h1 = 0, h2 = 0;
                    [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                    [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                    short h = (h1 << 8) + h2;
                    callback(CGSizeMake(w, h));
                } else {// 一个DQT字段
                    short w1 = 0, w2 = 0;
                    [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                    [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                    short w = (w1 << 8) + w2;
                    short h1 = 0, h2 = 0;
                    [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                    [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                    short h = (h1 << 8) + h2;
                    callback(CGSizeMake(w, h));
                }
            } else {
                callback(CGSizeZero);
            }
        }
    }];
    [task resume];
    
}
@end
