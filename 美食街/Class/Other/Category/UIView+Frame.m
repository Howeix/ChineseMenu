//
//  UIView+Frame.m
//  美食街
//
//  Created by 黄炜 on 2018/1/24.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
-(void)setHW_Width:(CGFloat)HW_Width{
    CGRect r = self.frame;
    r.size.width = HW_Width;
    self.frame = r;
}

-(void)setHW_Height:(CGFloat)HW_Height{
    CGRect r = self.frame;
    r.size.height = HW_Height;
    self.frame = r;
}

-(CGFloat)HW_Height{
    return self.frame.size.height;
}
-(CGFloat)HW_Width{
    return self.frame.size.width;
    
}

-(void)setHW_y:(CGFloat)HW_y{
    CGRect r = self.frame;
    r.origin.y = HW_y;
    self.frame = r;
}

-(void)setHW_x:(CGFloat)HW_x{
    CGRect r = self.frame;
    r.origin.x = HW_x;
    self.frame = r;
}
-(CGFloat)HW_x{
    return self.frame.origin.x;
}
-(CGFloat)HW_y{
    return self.frame.origin.y;
}

@end
