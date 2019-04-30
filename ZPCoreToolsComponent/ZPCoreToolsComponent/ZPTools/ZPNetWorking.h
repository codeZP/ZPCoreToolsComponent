//
//  ZPNetWorking.h
//  ZPToolsComponentDemo
//
//  Created by 恋指团 on 2019/4/16.
//  Copyright © 2019 恋指团. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 定义成功, 失败, 进度的回调
/**
 *  宏定义请求成功的block
 *
 *  请求成功返回的数据
 */
typedef void (^ZPResponseSuccess)(NSURLSessionDataTask *task, id _Nullable responseObject);

/**
 *  宏定义请求失败的block
 *
 *  报错信息
 */
typedef void (^ZPResponseFail)(NSURLSessionDataTask * _Nullable task, NSError *error);
/**
 *  上传或者下载的进度
 *
 *  progress 进度
 */
typedef void (^ZPProgress)(NSProgress * _Nonnull uploadProgress);

@interface ZPNetWorking : AFHTTPSessionManager

/**
 创建单利

 @return 返回单利
 */
+ (instancetype)sharedInstancetype;

/**
 get请求

 @param URLString url
 @param parameters 参数
 @param success 成功回调
 @param failure 失败回调
 @return 本次请求
 */
- (nullable NSURLSessionDataTask *)ZP_GET:(NSString *)URLString parameters:(nullable id)parameters success:(nullable ZPResponseSuccess)success failure:(nullable ZPResponseFail)failure;

/**
 post请求

 @param URLString url
 @param parameters 参数
 @param success 成功回调
 @param failure 失败回调
 @return 本次请求
 */
- (nullable NSURLSessionDataTask *)ZP_PSOT:(NSString *)URLString parameters:(nullable id)parameters success:(nullable ZPResponseSuccess)success failure:(nullable ZPResponseFail)failure;

/**
 文件上传

 @param URLString url
 @param parameters 参数
 @param filedata 文件二进制
 @param name 指定d参数名
 @param filename 文件名（要有后缀名）
 @param mimeType 文件类型
 @param progress 进度
 @param success 成功回调
 @param failure 失败回调
 @return 本次请求
 */
- (nullable NSURLSessionDataTask *)ZP_UploadWithURL:(NSString *)URLString parameters:(NSDictionary *)parameters fileData:(NSData *)filedata name:(NSString *)name fileName:(NSString *)filename mimeType:(NSString *) mimeType progress:(ZPProgress )progress success:(nullable ZPResponseSuccess)success failure:(nullable ZPResponseFail)failure;

/**
 *  下载文件
 *
 *  @param url      请求网络路径
 *  @param fileURL  保存文件url
 *  @param progress 下载进度
 *  @param success  成功回调
 *  @param fail     失败回调
 *
 *  @return 本次请求
 */
- (nullable NSURLSessionDownloadTask *)ZP_DownloadWithURL:(NSString *)url savePathURL:(NSURL *)fileURL progress:(ZPProgress )progress success:(void (^)(NSURLResponse *, NSURL *))success fail:(void (^)(NSError *))fail;
@end

NS_ASSUME_NONNULL_END
