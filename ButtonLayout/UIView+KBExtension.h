//
//  KBLayoutButton.h
//  AIWE
//
//  Created by BIMiracle on 2019/6/26.
//  Copyright © 2019年 BIMiracle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KBExtension)

@property (nonatomic, assign) CGSize kb_size;
@property (nonatomic, assign) CGFloat kb_width;
@property (nonatomic, assign) CGFloat kb_height;
@property (nonatomic, assign) CGFloat kb_x;
@property (nonatomic, assign) CGFloat kb_y;
@property (assign, nonatomic) CGFloat kb_maxX;
@property (assign, nonatomic) CGFloat kb_maxY;
// center is center of bounds
@property (nonatomic, assign) CGFloat kb_centerX;
@property (nonatomic, assign) CGFloat kb_centerY;

@property (nonatomic, assign, readonly) CGRect kb_sizeFrame;

@property (nonatomic, strong) UIViewController *kb_viewController;


@property (nonatomic, copy) void(^kb_layoutSubviewsCallback)(UIView *view);

/**
 *  移除所有子视图
 */
- (void)removeAllSubviews;

/**
 添加阴影
 */
- (void)kb_shadowWithOffset:(CGSize)shadowOffset withRadius:(CGFloat)shadowRadius withOpacity:(float)shadowOpacity withColor:(UIColor *)shadowColor;

@end
