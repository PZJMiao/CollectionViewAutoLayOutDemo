//
//  TextAndImageCell.m
//  CollectionViewAutoLayOutDemo
//
//  Created by 彭昭君 on 16/12/19.
//  Copyright © 2016年 pzj. All rights reserved.
//

#import "TextAndImageCell.h"
#import "LayoutModel.h"

@implementation TextAndImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)filleCellWithFeed:(LayoutModel *)model
{
    self.titleLabel.text = model.title;
    self.img.image = model.image;
    self.contentLabel.text = model.content;
}
@end
