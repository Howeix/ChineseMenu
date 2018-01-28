//
//  HWChuanCaiCell.m
//  美食街
//
//  Created by Jerry Huang on 2018/1/19.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "HWMenuDetailCell.h"
#import <UIImageView+WebCache.h>


@interface HWMenuDetailCell()


@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cookingTimeLabel;



@end


@implementation HWMenuDetailCell



-(void)setItem:(HWMenuDetailItem *)item{
    
    _item = item;
    self.nameLabel.text = [NSString stringWithFormat:@" 菜名:  %@",item.name];
    self.cookingTimeLabel.text = [NSString stringWithFormat:@" 简介:   %@",item.tag];
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:item.pic] placeholderImage:nil];
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
