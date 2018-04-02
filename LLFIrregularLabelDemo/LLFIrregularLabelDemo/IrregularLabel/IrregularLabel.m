//
//  IrregularLabel.m
//  LLFIrregularLabelDemo
//
//  Created by Gary-刘林飞 on 2018/4/2.
//  Copyright © 2018年 LiuLinFei. All rights reserved.
//

#import "IrregularLabel.h"

@interface IrregularLabel ()

/// 遮罩
@property (nonatomic, strong) CAShapeLayer *maskLayer;
/// 贝塞尔曲线
@property (nonatomic, strong) UIBezierPath *borderPath;

@end

@implementation IrregularLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化 遮罩
        self.maskLayer = [CAShapeLayer layer];
        // 设置 遮罩
        [self.layer setMask:self.maskLayer];
        // 初始化 路径
        self.borderPath = [UIBezierPath bezierPath];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 遮罩层
    self.maskLayer.frame = self.bounds;
    
    // 设置 path 的起点
    [self.borderPath moveToPoint:CGPointMake(0, 10)];
    // 左上角的圆角
    [self.borderPath addQuadCurveToPoint:CGPointMake(10, 0) controlPoint:CGPointMake(0, 0)];
    // 直线 到右上角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width - 10, 0)];
    // 右上角的圆角
    [self.borderPath addQuadCurveToPoint:CGPointMake(self.bounds.size.width, 10) controlPoint:CGPointMake(self.bounds.size.width, 0)];
    // 右下角的直角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    // 底部的小三角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width / 2 + 5, self.bounds.size.height)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - 5)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width / 2 - 5, self.bounds.size.height)];
    // 左下角的直角
    [self.borderPath addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    // 直线，回到原点
    [self.borderPath addLineToPoint:CGPointMake(0, 10)];
    
    // 将这个path赋值给CAShapeLayer的path
    self.maskLayer.path = self.borderPath.CGPath;
}

@end
