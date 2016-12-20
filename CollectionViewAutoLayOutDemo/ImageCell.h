//
//  ImageCell.h
//  CollectionViewAutoLayOutDemo
//
//  Created by 彭昭君 on 16/12/20.
//  Copyright © 2016年 pzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LayoutModel;
@interface ImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *img;

-(void)filleCellWithFeed:(LayoutModel *)model;

@end
