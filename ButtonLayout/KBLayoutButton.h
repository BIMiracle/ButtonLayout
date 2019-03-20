//
//  KBLayoutButton.h
//  manying
//
//  Created by BIMiracle on 2018/4/3.
//  Copyright © 2018年 BIMiracle. All rights reserved.
//  按钮布局

#import <UIKit/UIKit.h>

@interface KBLayoutButton : UIButton

@property (nonatomic, assign) IBInspectable CGFloat imageX;
@property (nonatomic, assign) IBInspectable CGFloat imageY;

@property (nonatomic, assign) IBInspectable CGFloat titleLabelX;
@property (nonatomic, assign) IBInspectable CGFloat titleLabelY;
@property (nonatomic, assign) IBInspectable CGFloat titleLabelWidth;
@property (nonatomic, assign) IBInspectable CGFloat titleLabelHeight;

@property (nonatomic, assign) IBInspectable CGFloat margin;

// TODO:更改为图片+间距+文字宽度 组成一个组件的中心点

/** 图片在左 文字在右 居中布局 以文字左边为中心点 (默认) */
@property (nonatomic, assign) IBInspectable BOOL leftCenter;

@property (nonatomic, assign) IBInspectable BOOL rightCenter;

/** 图片在上 文字在下 居中布局 以图片高度+margin+文字高度总和为中心点 */
@property (nonatomic, assign) IBInspectable BOOL topCenter;

@property (nonatomic, assign) IBInspectable BOOL bottomCenter;

@end
