//
//  KBLayoutButton.m
//  manying
//
//  Created by BIMiracle on 2018/4/3.
//  Copyright © 2018年 BIMiracle. All rights reserved.
//

#import "KBLayoutButton.h"
#import "UIView+KBExtension.h"

#define KBErrorLog(...) printf("❗️❗️❗️Error---- [%s] %s [第%d行] : %s\n", __TIME__, __PRETTY_FUNCTION__, __LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])

@implementation KBLayoutButton

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat imageWidth = self.imageWidth > 0 ? self.imageWidth : self.imageView.image.size.width;
    CGFloat imageHeight = self.imageHeight > 0 ? self.imageHeight : self.imageView.image.size.height;
    if (self.rightCenter){
        self.titleLabel.frame = CGRectMake(0, 0, self.titleLabel.kb_width, self.titleLabelHeight > 0 ? self.titleLabelHeight : self.titleLabel.kb_height);
        [self.titleLabel sizeToFit];
        self.titleLabel.kb_centerY = self.kb_centerY;
        
        CGFloat allWidth = self.titleLabel.kb_width + self.margin + imageWidth;
        if (self.autoWidth) {
            self.kb_width = allWidth;
            self.imageView.frame = CGRectMake(self.margin + self.titleLabel.kb_width, 0, imageWidth, imageHeight);
            self.imageView.kb_centerY = self.kb_centerY;
            self.titleLabel.kb_x = 0;
        }else{
            CGFloat halfAllWidth = allWidth * 0.5;
            self.titleLabel.kb_x = self.kb_centerX - halfAllWidth;
            self.imageView.frame = CGRectMake(self.titleLabel.kb_maxX + self.margin, 0, imageWidth, imageHeight);
            self.imageView.kb_centerY = self.kb_centerY;
            
            if (self.kb_width < allWidth) {
                KBErrorLog(@"%@设置的Button宽度不能低于 %f",self.titleLabel.text,allWidth);
            }
        }
        CGFloat allHeight = self.titleLabel.kb_height > imageHeight ? self.titleLabel.kb_height : imageHeight;
        if (self.autoHeight) {
            self.kb_height = allHeight;
        }else{
            if (self.kb_height < allHeight) {
                KBErrorLog(@"%@设置的Button高度不能低于 %f",self.titleLabel.text,allWidth);
            }
        }
    } else if (self.topCenter){
        [self.titleLabel sizeToFit];
        CGFloat allHeight = imageHeight + self.margin + self.titleLabel.frame.size.height;
        
        if (self.autoHeight) {
            self.kb_height = allHeight;
            self.imageView.frame = CGRectMake(0, 0, imageWidth, imageHeight);
            self.imageView.kb_centerX = self.kb_centerX;
            self.titleLabel.frame = CGRectMake(0, self.imageView.kb_maxY + self.margin, self.titleLabel.kb_width, self.titleLabelHeight > 0 ? self.titleLabelHeight : self.titleLabel.kb_height);
            self.titleLabel.kb_centerX = self.kb_centerX;
        }else{
            CGFloat imageY = (self.frame.size.height - allHeight) * 0.5;
            self.imageView.frame = CGRectMake(0, imageY, imageWidth, imageHeight);
            self.imageView.kb_centerX = self.kb_centerX;
            
            self.titleLabel.frame = CGRectMake(0, self.imageView.kb_maxY + self.margin, self.titleLabel.kb_width, self.titleLabelHeight > 0 ? self.titleLabelHeight : self.titleLabel.kb_height);
            self.titleLabel.kb_centerX = self.kb_centerX;
            if (self.kb_height < allHeight) {
                KBErrorLog(@"%@设置的Button高度不能低于 %f",self.titleLabel.text,allHeight);
            }
        }
        
        CGFloat allWidth = self.titleLabel.kb_width > imageWidth ? self.titleLabel.kb_width : imageWidth;
        if (self.autoWidth) {
            self.kb_width = allWidth;
        }else{
            if (self.kb_width < allWidth) {
                KBErrorLog(@"%@设置的Button宽度不能低于 %f",self.titleLabel.text,allWidth);
            }
        }
    } else if (self.bottomCenter){
        [self.titleLabel sizeToFit];
        CGFloat allHeight = imageHeight + self.margin + self.titleLabel.frame.size.height;
        
        if (self.autoHeight) {
            self.kb_height = allHeight;
            self.titleLabel.frame = CGRectMake(0, 0, self.titleLabel.kb_width, self.titleLabelHeight > 0 ? self.titleLabelHeight : self.titleLabel.kb_height);
            self.titleLabel.kb_centerX = self.kb_centerX;
            self.imageView.frame = CGRectMake(0,self.titleLabel.kb_maxY + self.margin, imageWidth, imageHeight);
            self.imageView.kb_centerX = self.kb_centerX;
        }else{
            CGFloat titleLabelY = (self.frame.size.height - allHeight) * 0.5;
            self.titleLabel.frame = CGRectMake(0, titleLabelY, self.titleLabel.kb_width, self.titleLabelHeight > 0 ? self.titleLabelHeight : self.titleLabel.kb_height);
            self.titleLabel.kb_centerX = self.kb_centerX;
            
            
            self.imageView.frame = CGRectMake(0, self.titleLabel.kb_maxY + self.margin, imageWidth, imageHeight);
            self.imageView.kb_centerX = self.kb_centerX;
            if (self.kb_height < allHeight) {
                KBErrorLog(@"%@设置的Button高度不能低于 %f",self.titleLabel.text,allHeight);
            }
        }
        CGFloat allWidth = self.titleLabel.kb_width > imageWidth ? self.titleLabel.kb_width : imageWidth;
        if (self.autoWidth) {
            self.kb_width = allWidth;
        }else{
            if (self.kb_width < allWidth) {
                KBErrorLog(@"%@设置的Button宽度不能低于 %f",self.titleLabel.text,allWidth);
            }
        }
    } else {
        // 图片左 文字右
        self.titleLabel.frame = CGRectMake(0, 0, self.titleLabel.kb_width, self.titleLabelHeight > 0 ? self.titleLabelHeight : self.titleLabel.kb_height);
        [self.titleLabel sizeToFit];
        self.titleLabel.kb_centerY = self.kb_centerY;
        
        CGFloat allWidth = self.titleLabel.kb_width + self.margin + imageWidth;
        if (self.autoWidth) {
            self.kb_width = allWidth;
            self.titleLabel.kb_x = self.margin + imageWidth;
            self.imageView.frame = CGRectMake(0, 0, imageWidth, imageHeight);
            self.imageView.kb_centerY = self.kb_centerY;
        }else{
            CGFloat halfAllWidth = allWidth * 0.5;
            self.imageView.frame = CGRectMake(self.kb_centerX - halfAllWidth, 0, imageWidth, imageHeight);
            self.imageView.kb_centerY = self.kb_centerY;
            self.titleLabel.kb_x = self.imageView.kb_maxX + self.margin;
            
            if (self.kb_width < allWidth) {
                KBErrorLog(@"%@设置的Button宽度不能低于 %f",self.titleLabel.text,allWidth);
            }
        }
        CGFloat allHeight = self.titleLabel.kb_height > imageHeight ? self.titleLabel.kb_height : imageHeight;
        if (self.autoHeight) {
            self.kb_height = allHeight;
        }else{
            if (self.kb_height < allHeight) {
                KBErrorLog(@"%@设置的Button高度不能低于 %f",self.titleLabel.text,allWidth);
            }
        }
    }
//    [self updateConstraintsIfNeeded];
    NSLog(@"%@  %@",self.titleLabel.text,NSStringFromCGRect(self.frame));
}

@end
