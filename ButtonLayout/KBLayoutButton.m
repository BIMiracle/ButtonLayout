//
//  KBLayoutButton.m
//  manying
//
//  Created by BIMiracle on 2018/4/3.
//  Copyright © 2018年 BIMiracle. All rights reserved.
//

#import "KBLayoutButton.h"
#import "UIView+KBExtension.h"

@implementation KBLayoutButton

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.rightCenter){
        CGFloat currentWidth = self.kb_width;
        [self.titleLabel sizeToFit];
        
        CGFloat imageWidth = self.imageView.image.size.width;
        
        self.imageView.frame = CGRectMake(0, 0, imageWidth, self.imageView.image.size.height);
        
        CGFloat allWidth = imageWidth + self.margin + self.titleLabel.kb_width;
        if (allWidth > currentWidth) {
            self.kb_x -= (allWidth - currentWidth) * 0.5;
            self.kb_width = allWidth;
            
            self.titleLabel.frame = CGRectMake(0, 0, self.titleLabel.kb_width, self.titleLabel.kb_height);
        }else{
            CGFloat imageX = (currentWidth - allWidth) * 0.5;
            self.titleLabel.kb_x = imageX;
        }
        self.titleLabel.kb_centerY = self.kb_centerY;
        self.imageView.kb_x = self.titleLabel.kb_maxX + self.margin;
        self.imageView.kb_centerY = self.kb_centerY;
        
    } else if (self.topCenter){
        CGFloat currentHeight = self.kb_height;
        [self.titleLabel sizeToFit];
        
        CGFloat imageHeight = self.imageView.image.size.height;
        
        self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, imageHeight);
        
        CGFloat allHeight = imageHeight + self.margin + self.titleLabel.kb_height;
        if (allHeight > currentHeight) {
            self.kb_y -= (allHeight - currentHeight) * 0.5;
            self.kb_height = allHeight;
            
            self.titleLabel.frame = CGRectMake(0, self.imageView.kb_maxY + self.margin, self.titleLabel.kb_width, self.titleLabel.kb_height);
        }else{
            CGFloat imageY = (currentHeight - allHeight) * 0.5;
            self.imageView.kb_y = imageY;
            self.titleLabel.kb_y = self.imageView.kb_maxY + self.margin;
        }
        self.imageView.kb_centerX = self.kb_centerX;
        self.titleLabel.kb_centerX = self.kb_centerX;
    } else if (self.bottomCenter){
        CGFloat currentHeight = self.kb_height;
        [self.titleLabel sizeToFit];
        
        CGFloat imageHeight = self.imageView.image.size.height;
        
        self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, imageHeight);
        
        CGFloat allHeight = imageHeight + self.margin + self.titleLabel.kb_height;
        if (allHeight > currentHeight) {
            self.kb_y -= (allHeight - currentHeight) * 0.5;
            self.kb_height = allHeight;
            
            self.titleLabel.frame = CGRectMake(0, 0, self.titleLabel.kb_width, self.titleLabel.kb_height);
        }else{
            CGFloat imageY = (currentHeight - allHeight) * 0.5;
            self.titleLabel.kb_y = imageY;
        }
        self.imageView.kb_centerX = self.kb_centerX;
        self.titleLabel.kb_centerX = self.kb_centerX;
        self.imageView.kb_y = self.titleLabel.kb_maxY + self.margin;
    } else {
        CGFloat currentWidth = self.kb_width;
        [self.titleLabel sizeToFit];
        
        CGFloat imageWidth = self.imageView.image.size.width;
        
        self.imageView.frame = CGRectMake(0, 0, imageWidth, self.imageView.image.size.height);
        
        CGFloat allWidth = imageWidth + self.margin + self.titleLabel.kb_width;
        if (allWidth > currentWidth) {
            // 如果当前Button的Frame小于图片+间距+文字的宽度,则增大Button的Frame
            self.kb_x -= (allWidth - currentWidth) * 0.5;
            self.kb_width = allWidth;
            
            self.titleLabel.frame = CGRectMake(imageWidth + self.margin, 0, self.titleLabel.kb_width, self.titleLabel.kb_height);
        }else{
            CGFloat imageX = (currentWidth - allWidth) * 0.5;
            self.imageView.kb_x = imageX;
            self.titleLabel.kb_x = self.imageView.kb_x + imageWidth + self.margin;
        }
        self.titleLabel.kb_centerY = self.kb_centerY;
        self.imageView.kb_centerY = self.kb_centerY;
    }
    
    NSLog(@"\ntitleLabel:%@\nimageView :%@\nbtn       :%@\n-------------------------",NSStringFromCGRect(self.titleLabel.frame),NSStringFromCGRect(self.imageView.frame),NSStringFromCGRect(self.frame));
}

@end
