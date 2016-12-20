//
//  ImageCell.m
//  CollectionViewAutoLayOutDemo
//
//  Created by 彭昭君 on 16/12/20.
//  Copyright © 2016年 pzj. All rights reserved.
//

#import "ImageCell.h"
#import "LayoutModel.h"

@implementation ImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)filleCellWithFeed:(LayoutModel *)model
{
    _img.image = model.image;
}

@end
