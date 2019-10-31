//
//  KBLayoutButton.h
//  AIWE
//
//  Created by BIMiracle on 2019/6/26.
//  Copyright © 2019年 BIMiracle. All rights reserved.
//  按钮布局

#import <UIKit/UIKit.h>


/// 控制图片在UIButton里的位置，默认为QMUIButtonImagePositionLeft
typedef NS_ENUM(NSUInteger, QMUIButtonImagePosition) {
    QMUIButtonImagePositionTop = 0,             // imageView在titleLabel上面
    QMUIButtonImagePositionLeft,            // imageView在titleLabel左边
    QMUIButtonImagePositionBottom,          // imageView在titleLabel下面
    QMUIButtonImagePositionRight,           // imageView在titleLabel右边
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

/**
 * 设置按钮里图标和文字的相对位置，默认为QMUIButtonImagePositionLeft<br/>
 * 可配合imageEdgeInsets、titleEdgeInsets、contentHorizontalAlignment、contentVerticalAlignment使用
 */
@property(nonatomic, assign) QMUIButtonImagePosition imagePosition;

/**
 * 设置按钮里图标和文字之间的间隔，会自动响应 imagePosition 的变化而变化，默认为0。<br/>
 * 系统默认实现需要同时设置 titleEdgeInsets 和 imageEdgeInsets，同时还需考虑 contentEdgeInsets 的增加（否则不会影响布局，可能会让图标或文字溢出或挤压），使用该属性可以避免以上情况。<br/>
 * @warning 会与 imageEdgeInsets、 titleEdgeInsets、 contentEdgeInsets 共同作用。
 */
@property(nonatomic, assign) IBInspectable CGFloat spacingBetweenImageAndTitle;



@end
