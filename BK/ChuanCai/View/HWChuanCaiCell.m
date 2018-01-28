//
//  HWChuanCaiCell.m
//  美食街
//
//  Created by Jerry Huang on 2018/1/19.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "HWChuanCaiCell.h"
#import <UIImageView+WebCache.h>

@class HWChuanCaiItem;
@interface HWChuanCaiCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cookingTimeLabel;




@end


@implementation HWChuanCaiCell



-(void)setItem:(HWChuanCaiItem *)item{
    
    _item = item;
    self.nameLabel.text = [NSString stringWithFormat:@" 菜名: %@",item.name];
    self.cookingTimeLabel.text = [NSString stringWithFormat:@"  烹制时间: %@",item.cookingtime];
    
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
