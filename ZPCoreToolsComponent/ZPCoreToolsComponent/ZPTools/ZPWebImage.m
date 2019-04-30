//
//  ZPWebImage.m
//  ZPToolsComponentDemo
//
//  Created by CodeZP on 2019/4/16.
//  Copyright © 2019 恋指团. All rights reserved.
//

#import "ZPWebImage.h"
#import <SDWebImage/UIButton+WebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

#pragma mark - 按钮设置图片
@implementation UIButton (ZPImage)

- (void)zp_setImageWithURLString:(NSString *)urlStr forState:(UIControlState)state placeholderImage:(UIImage *)placeholderImage {
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] forState:state placeholderImage:placeholderImage];
}

- (void)zp_setBackgroundImageWithURLString:(NSString *)urlStr forState:(UIControlState)state placeholderImage:(UIImage *)placeholderImage {
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] forState:state placeholderImage:placeholderImage];
}

@end

@implementation UIImageView (ZPImage)

- (void)zp_setImageWithURLString:(NSString *)urlStr placeholderImage:(UIImage *)placeholderImage {
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:placeholderImage];
}

@end
