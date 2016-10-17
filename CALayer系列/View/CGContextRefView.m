//
//  CGContextRefView.m
//  CALayer系列
//
//  Created by 王双龙 on 16/10/12.
//  Copyright © 2016年 http://www.jianshu.com/users/e15d1f644bea All rights reserved.
//

#import "CGContextRefView.h"

@implementation CGContextRefView

/*
 CGConTextRef相当于一个画布，我们可以在上面画各种各样的图形，而这个画布又是在 View 上。所以我们对 CGConTextRef 进行的一切操作相当于在 View 上进行。
 在 View 中系统回自动执行 - (void)drawRect:(CGRect)rect 这个方法，所以我们需要在这个方法中，创建一个画布，然后对其进行操作。
 */

- (void)drawRect:(CGRect)rect {
    
    //获得当前画板
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //画线的宽度 参数为 画板 宽度
    CGContextSetLineWidth(ctx, 3);
    CGContextSaveGState(ctx);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    // 这里的图像会有阴影效果
    CGContextSetShadow(ctx, CGSizeMake(4, 20), 2);
    //CGContextSetShadowWithColor(ctx, CGSizeMake(4, 20), 2, [UIColor orangeColor].CGColor);
    //缩放
    CGContextScaleCTM(ctx, 1, 1);
    //反转重新绘制
    //CGContextTranslateCTM(ctx, 100,100);
    //CGContextRotateCTM(ctx, M_PI/4);

    // 这里的图像无阴影效果
    //CGContextRestoreGState(ctx);
    
    
    
    //写字
    //开始把NSString写到画布上 参数：X,Y,W,H
    //NSStrokeWidthAttributeName这个属性所对应的值是一个 NSNumber 对象(小数)。该值改变描边宽度（相对于字体size 的百分比）。默认为 0，即不改变。正数只改变描边宽度。负数同时改变文字的描边和填充宽度。例如，对于常见的空心字，这个值通常为3.0。
    [@"且行且珍惜_iOS" drawInRect:CGRectMake(20, 20, 250, 50) withAttributes:@{NSFontAttributeName :[UIFont systemFontOfSize:25],NSBackgroundColorAttributeName : [UIColor blackColor],NSForegroundColorAttributeName : [UIColor redColor],NSStrokeColorAttributeName : [UIColor greenColor], NSStrokeWidthAttributeName : @-3}];
    /*
     颜色
     ctx     画板名
     red   红
     green 绿
     blue  蓝
     alpha 透明度
     */
    //CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1.0);
    CGContextStrokePath(ctx);
    
    //画线
    //顶部横线
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddLineToPoint(ctx, self.bounds.size.width - 2 * 10, 10);
    CGContextStrokePath(ctx);
    
    
    //画矩形
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1.0);
    CGContextAddRect(ctx, CGRectMake(10, 100, 50, 50));
    //CGContextStrokePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    
    //画圆
    //        void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    //         x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, 20, 0, 2*M_PI, 0);
    CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);//填充颜色
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1.0);
    /*
     kCGPathFill,//实心
     kCGPathEOFill,
     kCGPathStroke, //空心
     kCGPathFillStroke, //带边框的实心
     kCGPathEOFillStroke
     kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
     */
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke); //绘制路径
    
    
    //画弧线
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);//改变画笔颜色
    CGContextMoveToPoint(ctx, 140, 80);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p2形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(ctx, 160, 60, 180, 80, 20);
    CGContextStrokePath(ctx);//绘画路径
    
    
    //画椭圆
    CGContextAddEllipseInRect(ctx, CGRectMake(160, 180, 20, 10)); //椭圆
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    
    //画三角形
    //只要三个点就行跟画一条线方式一样，把三点连接起来
    CGPoint sPoints[3];//坐标点
    sPoints[0] =CGPointMake(100, 220);//坐标1
    sPoints[1] =CGPointMake(130, 220);//坐标2
    sPoints[2] =CGPointMake(130, 160);//坐标3
    CGContextAddLines(ctx, sPoints, 3);//添加线
    CGContextClosePath(ctx);//封起来
    CGContextDrawPath(ctx, kCGPathStroke); //根据坐标绘制路径
    
    
    //画圆角矩形
    float fw = 180;
    float fh = 320;
    CGContextMoveToPoint(ctx, fw, fh-20);  // 开始坐标右边开始
    CGContextAddArcToPoint(ctx, fw, fh, fw-20, fh, 10);  // 右下角角度
    CGContextAddArcToPoint(ctx, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(ctx, 120, 290, fw-20, 290, 10); // 左上角
    CGContextAddArcToPoint(ctx, fw, 290, fw, fh-20, 10); // 右上角
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathStroke); //根据坐标绘制路径
    
    
    //画图片
    UIImage *image = [UIImage imageNamed:@"wang.jpeg"];
    NSLog(@"%f %f",image.size.width, image.size.height);
    [image drawInRect:CGRectMake(60, 340, 72, 60)];//在坐标中画出图片
    // [image drawAtPoint:CGPointMake(100, 340)];//保持图片大小在point点开始画图片，可以把注释去掉看看
    CGContextDrawImage(ctx, CGRectMake(150, 340, 72, 60), image.CGImage);//使用这个使图片上下颠倒了，参考http://blog.csdn.net/koupoo/article/details/8670024
    //CGContextDrawTiledImage(ctx, CGRectMake(0, 0, 20, 20), image.CGImage);//平铺图
    
    
    /*画贝塞尔曲线*/
    //二次曲线
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    CGContextMoveToPoint(ctx, 120, 300);//设置Path的起点
    CGContextAddQuadCurveToPoint(ctx,190, 310, 120, 390);//设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextStrokePath(ctx);
    //三次曲线函数
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextMoveToPoint(ctx, 200, 300);//设置Path的起点
    CGContextAddCurveToPoint(ctx,250, 280, 250, 400, 280, 300);//设置贝塞尔曲线的控制点坐标和控制点坐标终点坐标
    CGContextStrokePath(ctx);
    
    
    
    // 布局画板
    [super drawRect:rect];  // 这个方法只用加载一次
    
    //http://blog.csdn.net/rhljiayou/article/details/9919713
}



@end
