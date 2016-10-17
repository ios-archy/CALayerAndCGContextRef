//
//  CAShapeLayerViewController.m
//  CALayer系列
//
//  Created by 王双龙 on 16/10/10.
//  Copyright © 2016年 http://www.jianshu.com/users/e15d1f644bea All rights reserved.
//

#import "CAShapeLayerViewController.h"

@interface CAShapeLayerViewController ()

@end

@implementation CAShapeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CAShapeLayer";
    self.view.backgroundColor = [UIColor whiteColor];
    [self create];
}

- (void)create{
    
    /*
     CAShapeLayer是图形layer层，我们可以自定义这个层的形状
     属性：
     @property(nullable) CGPathRef path;为CAShapeLayer设置一个边界路径
     
     //设置图形的填充颜色
     @property(nullable) CGColorRef fillColor;
    
    // 设置图形的填充规则 选项如下：
     非零填充
     NSString *const kCAFillRuleNonZero;
     奇偶填充
     NSString *const kCAFillRuleEvenOdd;
    
    @property(copy) NSString *fillRule;
    //设置线条颜色
    @property(nullable) CGColorRef strokeColor;
    //设置线条的起点与终点 0-1之间
    @property CGFloat strokeStart;
    @property CGFloat strokeEnd;
    //设置线条宽度
    @property CGFloat lineWidth;
    //设置两条线段相交时锐角斜面长度
    @property CGFloat miterLimit;
    
     //设置线条首尾的外观
     可选参数如下
     无形状
     NSString *const kCALineCapButt;
     圆形
     NSString *const kCALineCapRound;
     方形
     NSString *const kCALineCapSquare;
    
    @property(copy) NSString *lineCap;
   
     //设置线段的链接方式
     棱角
     NSString *const kCALineJoinMiter;
     平滑
     NSString *const kCALineJoinRound;
     折线
     NSString *const kCALineJoinBevel;
    @property(copy) NSString *lineJoin;
     
     */
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.position=CGPointMake(0,0);
    //路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, 0, 100, 100);
    CGPathAddLineToPoint(path, 0, 300, 100);
    CGPathAddLineToPoint(path, 0, 200, 200);
    CGPathAddLineToPoint(path, 0, 100, 200);
    CGPathAddLineToPoint(path, 0, 100, 100);
    layer.path = path;
    layer.fillColor= [UIColor redColor].CGColor;
    layer.fillRule = kCAFillRuleEvenOdd;
    layer.strokeColor = [UIColor greenColor].CGColor;
    layer.strokeStart = 0.2;
    layer.strokeEnd = 0.5;
    layer.lineWidth = 3;
    layer.miterLimit = 1;
    layer.lineCap =  kCALineCapSquare;
    layer.lineJoin = kCALineJoinMiter;
    [self.view.layer addSublayer:layer];
    
    //设置边界的线条为虚线
    //设置线段的宽度为5px 间距为10px
    /*
     这个数组中还可以继续添加，会循环进行设置 例如 5 2 1 3 则第一条线段5px，间距2px，第二条线段1px 间距3px再开始第一条线段
     */
    layer.lineDashPattern = @[@05,@10];
    //设置从哪个位置开始
    layer.lineDashPhase = 10;
    
    
    CAShapeLayer * layer1 = [CAShapeLayer layer];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake((self.view.frame.size.width-40)/2-50, 250, 100, 100) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(50, 50)];
    layer1.path = path1.CGPath;
    layer1.fillColor = [UIColor clearColor].CGColor;
    layer1.strokeColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:layer1];
    
    //阴影
    layer1.shadowPath = path1.CGPath;
    layer1.shadowOffset = CGSizeMake(10, 10);
    layer1.shadowColor = [UIColor grayColor].CGColor;
    //layer.shadowRadius = 10;
    //阴影不透明度
    layer1.shadowOpacity = 0.4;
    
    layer1.lineDashPattern = @[@05,@10];
    //设置从哪个位置开始
    layer1.lineDashPhase = 5;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
