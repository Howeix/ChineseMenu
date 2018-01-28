//
//  HWMenuDetailItem.h
//  美食街
//
//  Created by 黄炜 on 2018/1/22.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWMenuDetailItem : NSObject
//** classid */
@property (strong, nonatomic) NSString *classid;
/* content  label*/
@property(strong,nonatomic)NSString *content;
/* cookingtime  label*/
@property(strong,nonatomic)NSString *cookingtime;
//** id  */
//@property (strong, nonatomic) NSString *id;
//** material  字典数组: @[@{@"mname" : @"xx", @"amount" : @"xx"},...]  */
@property (strong, nonatomic) NSArray *material;
/* name  label */
@property(strong,nonatomic)NSString *name;
/* peoplenum  label */
@property(strong,nonatomic)NSString *peoplenum;
/* pic  UIImageView*/
@property(strong,nonatomic)NSString *pic;
/* preparetime  label*/
@property(strong,nonatomic)NSString *preparetime;
//** process   字典数组 @[@{@"pcontent": @"xxx", @"pic" : @"xxx"}] */
@property(strong, nonatomic)NSArray *process;
/* tag */
@property(strong,nonatomic)NSString *tag;
@end
