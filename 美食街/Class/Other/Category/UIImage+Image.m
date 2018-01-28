//
//  UIImage+Image.m
//  美食街
//
//  Created by 黄炜 on 2018/1/17.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+(instancetype)imageWithOriginalImage:(UIImage *)image{
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
