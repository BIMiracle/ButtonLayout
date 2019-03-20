//
//  UIView+KBExtension.m
//  YoungPin
//
//  Created by BIMiracle on 2017/7/4.
//  Copyright © 2017年 BIMiracle. All rights reserved.
//

#import "UIView+KBExtension.h"
#import <objc/runtime.h>

@implementation UIView (KBExtension)

#pragma mark - Set And Get

- (void)setKb_size:(CGSize)kb_size {
    CGRect frame = self.frame;
    frame.size = kb_size;
    self.frame = frame;
}

- (void)setKb_width:(CGFloat)kb_width {
    CGRect frame = self.frame;
    frame.size.width = kb_width;
    self.frame = frame;
}

- (void)setKb_height:(CGFloat)kb_height {
    CGRect frame = self.frame;
    frame.size.height = kb_height;
    self.frame = frame;
}

- (void)setKb_x:(CGFloat)kb_x {
    CGRect frame = self.frame;
    frame.origin.x = kb_x;
    self.frame = frame;
}

- (void)setKb_y:(CGFloat)kb_y {
    CGRect frame = self.frame;
    frame.origin.y = kb_y;
    self.frame = frame;
}

- (void)setKb_maxX:(CGFloat)kb_maxX {
    CGRect frame = self.frame;
    frame.origin.x = kb_maxX - [self kb_width];
    self.frame = frame;
}

- (void)setKb_maxY:(CGFloat)kb_maxY {
    CGRect frame = self.frame;
    frame.origin.y = kb_maxY - [self kb_height];
    self.frame = frame;
}

- (void)setKb_centerX:(CGFloat)kb_centerX {
    CGPoint center = self.center;
    center.x = kb_centerX;
    self.center = center;
}

- (void)setKb_centerY:(CGFloat)kb_centerY {
    CGPoint center = self.center;
    center.y = kb_centerY;
    self.center = center;
}

- (CGSize)kb_size {
    return self.frame.size;
}

- (CGFloat)kb_width {
    return self.frame.size.width;
}

- (CGFloat)kb_height {
    return self.frame.size.height;
}

- (CGFloat)kb_x {
    return self.frame.origin.x;
}

- (CGFloat)kb_y {
    return self.frame.origin.y;
}

- (CGFloat)kb_maxX {
    return [self kb_x] + [self kb_width];
}

- (CGFloat)kb_maxY {
    return [self kb_y] + [self kb_height];
}

- (CGFloat)kb_centerY {
    return [self kb_height] * 0.5;
}

- (CGFloat)kb_centerX {
    return [self kb_width] * 0.5;
}

- (CGRect)kb_sizeFrame{
    return CGRectMake(0, 0, self.kb_width, self.kb_height);
}



- (void)setKb_viewController:(UIViewController *)kb_viewController{
    objc_setAssociatedObject(self, @selector(kb_viewController), kb_viewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- ( UIViewController * _Nullable )kb_viewController {
    UIViewController *vc = objc_getAssociatedObject(self, _cmd);
    if (!vc) {
        UIViewController *selfController = [self viewController];
        [self setKb_viewController:selfController];
        vc = selfController;
    }
    return vc;
}

#pragma mark - method

- (void)removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (UIViewController* _Nullable )viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


- (void)addBorderColor:(UIColor *)color{
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:0.5];
    [self.layer setCornerRadius:4];
}


- (void)kb_shadowWithOffset:(CGSize)shadowOffset withRadius:(CGFloat)shadowRadius withOpacity:(float)shadowOpacity withColor:(UIColor *)shadowColor{
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowRadius = shadowRadius; // 阴影半径
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.borderColor = shadowColor.CGColor; // 边框颜色建议和阴影颜色一致
    self.layer.borderWidth = 0.000001; // 只要不为0就行
    self.clipsToBounds = NO;
}

+ (void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod(self, @selector(layoutSubviews));
        Method newMethod = class_getInstanceMethod(self, @selector(kb_layoutSubviews));
        method_exchangeImplementations(originalMethod, newMethod);
    });
}

- (void)kb_layoutSubviews {
    [self kb_layoutSubviews];
    
    !self.kb_layoutSubviewsCallback ?: self.kb_layoutSubviewsCallback(self);
}

- (void)setKb_layoutSubviewsCallback:(void (^)(UIView *))kb_layoutSubviewsCallback{
    objc_setAssociatedObject(self, @selector(kb_layoutSubviewsCallback), kb_layoutSubviewsCallback, OBJC_ASSOCIATION_RETAIN);
}

- (void (^)(UIView *))kb_layoutSubviewsCallback {
    return objc_getAssociatedObject(self, _cmd);
}

@end
