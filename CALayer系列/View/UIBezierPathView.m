//
//  UIBezierPathView.m
//  CALayer系列
//
//  Created by 王双龙 on 16/10/13.
//  Copyright © 2016年 http://www.jianshu.com/users/e15d1f644bea All rights reserved.
//

#import "UIBezierPathView.h"

@implementation UIBezierPathView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

- (void)drawRect:(CGRect)rect {
    
    //UIBezierPath是UIKit中的一个关于图形绘制的类，是通过Quartz 2D也就是CG（Core Graphics）CGPathRef的封装得到的，从高级特性支持来看不及CG。
    //关于贝塞尔曲线的详细介绍可以去这里 ：http://www.jianshu.com/p/6c9aa9c5dd68
    
    /*
     // 创建基本路径
     + (instancetype)bezierPath;
     // 创建矩形路径
     + (instancetype)bezierPathWithRect:(CGRect)rect;
     // 创建椭圆路径
     + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
     // 创建圆角矩形
     + (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
     // 创建指定位置圆角的矩形路径
     + (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
     // 创建弧线路径
     + (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
     // 通过CGPath创建
     + (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath;
     
     */

    UIColor *color = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    [color set];//设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound;//线条拐角
    aPath.lineJoinStyle = kCGLineCapRound;//终点处理
    // 起点
    [aPath moveToPoint:CGPointMake(100.0, 20)];
    // 绘制线条
    [aPath addLineToPoint:CGPointMake(200.0, 60.0)];
    [aPath addLineToPoint:CGPointMake(160, 160)];
    [aPath addLineToPoint:CGPointMake(60.0, 160)];
    [aPath addLineToPoint:CGPointMake(0.0, 60)];
    [aPath closePath];//封闭未形成闭环的路径
    //根据坐标点连线
    [aPath stroke];
    //填充
    //[aPath fill];
    
    
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
      [[UIColor blueColor] set];
    [path moveToPoint:CGPointMake(20, 200)];
    // 给定终点和两个控制点绘制贝塞尔曲线
    [path addCurveToPoint:CGPointMake(220, 200) controlPoint1:CGPointMake(120, 120) controlPoint2:CGPointMake(120, 280)];
    [path stroke];
    
    
    
    
    // 创建弧线路径对象
    UIBezierPath* path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100)
                                                        radius:70
                                                    startAngle:3.1415926
                                                      endAngle:3.1415926 *3/2
                                                     clockwise:YES];
    [[UIColor redColor] set];
    
    path1.lineWidth     = 5.f;
    path1.lineCapStyle  = kCGLineCapRound;
    path1.lineJoinStyle = kCGLineCapRound;
    [path1 closePath] ;//封闭未形成闭环的路径
    [path1 stroke];

    
    

}


@end
