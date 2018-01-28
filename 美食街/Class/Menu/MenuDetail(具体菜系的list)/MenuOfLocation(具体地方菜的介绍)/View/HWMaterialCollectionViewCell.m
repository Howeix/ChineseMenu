//
//  HWMaterialCollectionViewCell.m
//  美食街
//
//  Created by Jerry Huang on 2018/1/24.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "HWMaterialCollectionViewCell.h"

@interface HWMaterialCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *mname;
@property (weak, nonatomic) IBOutlet UILabel *amount;


@end

@implementation HWMaterialCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}





-(void)setItem:(HWMaterialItem *)item{
    
    _item = item;
    self.mname.text = _item.mname;
    self.amount.text = _item.amount;
    
}


@end
