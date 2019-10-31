//
//  KBLayoutButton.h
//  AIWE
//
//  Created by BIMiracle on 2019/6/26.
//  Copyright © 2019年 BIMiracle. All rights reserved.
//  按钮布局

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KBButtonImagePosition) {
    KBButtonImagePositionTop = 0,             // imageView在上
    KBButtonImagePositionLeft,            // imageView在左
    KBButtonImagePositionBottom,          // imageView在下
    KBButtonImagePositionRight,           // imageView在右
};

IB_DESIGNABLE
@interface KBLayoutButton : UIButton

@property (nonatomic, assign) IBInspectable CGFloat imageWidth;
@property (nonatomic, assign) IBInspectable CGFloat imageHeight;

@property (nonatomic, assign) IBInspectable CGFloat titleLabelHeight;

@property (nonatomic, assign) IBInspectable CGFloat margin;

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

/**
 *  子类继承时重写的方法，一般不建议重写 initWithXxx
 */
- (void)didInitialize NS_REQUIRES_SUPER;

@property(nonatomic, assign) KBButtonImagePosition imagePosition;

@end
