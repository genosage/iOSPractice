//
//  ZTCell.m
//  TableViewDemo
//
//  Created by 张添 on 2017/9/7.
//  Copyright © 2017年 Tian Zhang. All rights reserved.
//

#import "ZTCell.h"

@implementation ZTCell

// 重写init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 创建图片:cellImage，并添加到cell上
        CGFloat imageX = 10;
        CGFloat imageY = 10;
        CGFloat imageWidth = 100;
        CGFloat imageHeight = 100;
        self.cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageWidth, imageHeight)];
        self.cellImage.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.cellImage];
        
        // 创建标题:cellTitle，并添加到cell上
        CGFloat titleX = CGRectGetMaxX(self.cellImage.frame) + 10;
        CGFloat titleY = 10;
        CGFloat titleWidth = self.frame.size.width - titleX;
        CGFloat titleHeight = 20;
        self.cellTitle = [[UILabel alloc] initWithFrame: CGRectMake(titleX, titleY, titleWidth, titleHeight)];
        self.cellTitle.text = @"cell的标题";
        self.cellTitle.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.cellTitle];
        
        // 创建内容:cellText，并添加到cell上
        CGFloat textX = self.cellTitle.frame.origin.x;
        CGFloat textY = CGRectGetMaxY(self.cellTitle.frame) + 10;
        CGFloat textWidth = titleWidth;
        CGFloat textHeight = 50;
        self.cellText = [[UILabel alloc] initWithFrame:CGRectMake(textX, textY, textWidth, textHeight)];
        self.cellText.text = @"cell的内容xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
        self.cellText.font = [UIFont systemFontOfSize:12];
        self.cellText.numberOfLines = 0;
        [self.contentView addSubview:self.cellText];
        
        // 创建日期:cellDate，并添加到cell上
        CGFloat dateX = 10;
        CGFloat dateY = CGRectGetMaxY(self.cellImage.frame) + 10;
        CGFloat dateWidth = self.frame.size.width - dateX*2;
        CGFloat dateHeight = 20;
        self.cellDate = [[UILabel alloc] initWithFrame:CGRectMake(dateX, dateY, dateWidth, dateHeight)];
        self.cellDate.text = @"2016-06-30";
        self.cellDate.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.cellDate];
    }
    return self;
}

@end
