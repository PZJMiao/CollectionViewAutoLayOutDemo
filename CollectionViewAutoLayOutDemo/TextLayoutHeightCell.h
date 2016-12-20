//
//  TextLayoutHeightCell.h
//  CollectionViewAutoLayOutDemo
//
//  Created by 彭昭君 on 16/12/19.
//  Copyright © 2016年 pzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayoutModel.h"

@interface TextLayoutHeightCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

-(void)filleCellWithFeed:(LayoutModel *)model;

@end
