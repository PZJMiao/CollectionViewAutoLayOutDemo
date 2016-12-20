//
//  TextAndImageCell.h
//  CollectionViewAutoLayOutDemo
//
//  Created by 彭昭君 on 16/12/19.
//  Copyright © 2016年 pzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LayoutModel;
@interface TextAndImageCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *img;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

-(void)filleCellWithFeed:(LayoutModel *)model;

@end
