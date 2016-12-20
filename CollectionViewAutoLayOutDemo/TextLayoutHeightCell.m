//
//  TextLayoutHeightCell.m
//  CollectionViewAutoLayOutDemo
//
//  Created by 彭昭君 on 16/12/19.
//  Copyright © 2016年 pzj. All rights reserved.
//

#import "TextLayoutHeightCell.h"

@implementation TextLayoutHeightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)filleCellWithFeed:(LayoutModel *)model
{
    self.contentLabel.text = model.content;
}

@end
