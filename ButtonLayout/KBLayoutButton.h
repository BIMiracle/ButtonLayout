//
//  KBLayoutButton.h
//  manying
//
//  Created by BIMiracle on 2018/4/3.
//  Copyright © 2018年 BIMiracle. All rights reserved.
//  按钮布局

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface KBLayoutButton : UIButton

//@property (nonatomic, assign) IBInspectable CGFloat imageX;
//@property (nonatomic, assign) IBInspectable CGFloat imageY;
@property (nonatomic, assign) IBInspectable CGFloat imageWidth;
@property (nonatomic, assign) IBInspectable CGFloat imageHeight;

//@property (nonatomic, assign) IBInspectable CGFloat titleLabelX;
//@property (nonatomic, assign) IBInspectable CGFloat titleLabelY;
//@property (nonatomic, assign) IBInspectable CGFloat titleLabelWidth;
@property (nonatomic, assign) IBInspectable CGFloat titleLabelHeight;

@property (nonatomic, assign) IBInspectable CGFloat margin;

// 统一以图片高度+margin+文字高度总和为中心点

/** 图片在左 文字在右 默认 */

/** 图片在右 文字在左 */
@property (nonatomic, assign) IBInspectable BOOL rightCenter;

/** 图片在上 文字在下 */
@property (nonatomic, assign) IBInspectable BOOL topCenter;

/** 图片在下 文字在上 */
@property (nonatomic, assign) IBInspectable BOOL bottomCenter;

/** 是否自动宽度适应 默认为NO 手动设置宽度并计算 */
@property (nonatomic, assign) IBInspectable BOOL autoWidth;
/** 是否自动高度适应 默认为NO 手动设置高度并计算 */
@property (nonatomic, assign) IBInspectable BOOL autoHeight;

@end
