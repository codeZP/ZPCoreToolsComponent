//
//  ZPWebImage.h
//  ZPToolsComponentDemo
//
//  Created by CodeZP on 2019/4/16.
//  Copyright © 2019 恋指团. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 按钮设置图片
@interface UIButton (ZPImage)

/**
 给按钮设置前景图

 @param urlStr 图片地址
 @param state 按钮状态
 @param placeholderImage 占位图片
 */
- (void)zp_setImageWithURLString:(nullable NSString *)urlStr forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholderImage;

/**
 给按钮设置背景图片

 @param urlStr 图片地址
 @param state 状态
 @param placeholderImage 占位图片
 */
- (void)zp_setBackgroundImageWithURLString:(nullable NSString *)urlStr forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholderImage;

@end

#pragma mark - UIImageView设置图片
@interface UIImageView (ZPImage)

/**
 给UIImageView设置图片

 @param urlStr 图片地址
 @param placeholderImage 占位图片
 */
- (void)zp_setImageWithURLString:(nullable NSString *)urlStr placeholderImage:(nullable UIImage *)placeholderImage;

@end
NS_ASSUME_NONNULL_END
