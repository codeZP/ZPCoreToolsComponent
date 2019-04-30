//
//  ZPNetWorking.m
//  ZPToolsComponentDemo
//
//  Created by 恋指团 on 2019/4/16.
//  Copyright © 2019 恋指团. All rights reserved.
//

#import "ZPNetWorking.h"

@implementation ZPNetWorking

static ZPNetWorking *_instancetype;

+ (instancetype)sharedInstancetype {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instancetype = [[super alloc] init];
        _instancetype.responseSerializer = [AFJSONResponseSerializer serializer];
        AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
#warning 在这里做一些设置
        // 超时时间
        requestSerializer.timeoutInterval = 10;
        _instancetype.requestSerializer = requestSerializer;
        ///2.获取AFN原有的数据解析类型 然后新增一些响应解析器能够接受的数据类型
        NSMutableSet *acceptableContentTypes = [NSMutableSet setWithSet:_instancetype.responseSerializer.acceptableContentTypes];
        [acceptableContentTypes addObjectsFromArray:@[@"application/json", @"text/json", @"text/javascript",@"text/html",@"plant/html",@"text/plain",@"text/xml"]];
        _instancetype.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    });
    return _instancetype;
}

- (NSURLSessionDataTask *)ZP_GET:(NSString *)URLString parameters:(id)parameters success:(ZPResponseSuccess)success failure:(ZPResponseFail)failure {
    return [self GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);
    }];
}

- (NSURLSessionDataTask *)ZP_PSOT:(NSString *)URLString parameters:(id)parameters success:(ZPResponseSuccess)success failure:(ZPResponseFail)failure {
    return [self POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);
    }];
}

- (NSURLSessionDataTask *)ZP_UploadWithURL:(NSString *)URLString parameters:(NSDictionary *)parameters fileData:(NSData *)filedata name:(NSString *)name fileName:(NSString *)filename mimeType:(NSString *)mimeType progress:(ZPProgress )progress success:(ZPResponseSuccess)success failure:(ZPResponseFail)failure {
    return [self POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:filedata name:name fileName:filename mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task, error);
    }];
}

- (NSURLSessionDownloadTask *)ZP_DownloadWithURL:(NSString *)url savePathURL:(NSURL *)fileURL progress:(ZPProgress )progress success:(void (^)(NSURLResponse * _Nonnull, NSURL * _Nonnull))success fail:(void (^)(NSError * _Nonnull))fail {
    NSURL *urlpath = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlpath];
    return [self downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [fileURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error) {
            fail(error);
        }else{
            
            success(response,filePath);
        }
    }];
}

@end
