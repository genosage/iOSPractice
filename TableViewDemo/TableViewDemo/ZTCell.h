//
//  ZTCell.h
//  TableViewDemo
//
//  Created by 张添 on 2017/9/7.
//  Copyright © 2017年 Tian Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTCell : UITableViewCell

// 图像
@property (nonatomic, strong) UIImageView *cellImage;

// 标题
@property (nonatomic, strong) UILabel *cellTitle;

// 内容
@property (nonatomic, strong) UILabel *cellText;

// 日期
@property (nonatomic, strong) UILabel *cellDate;

@end
