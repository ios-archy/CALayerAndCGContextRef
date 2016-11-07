//
//  CAGradientLayerViewController.m
//  CALayer系列
//
//  Created by 王双龙 on 16/10/10.
//  Copyright © 2016年 http://www.jianshu.com/users/e15d1f644bea All rights reserved.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()

@end

@implementation CAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CAGradientLayer";
    
    [self create];
}

- (void)create{
    
    // CAGradientLayer是用于色彩梯度展示的layer图层
    
    /*CAGradientLayer的一些属性
     //颜色数组，设置我们需要过的的颜色，必须是CGColor对象
    @property(nullable, copy) NSArray *colors;
   
     //颜色开始进行过渡的位置
     这个数组中的元素是NSNumber类型，单调递增的，并且在0——1之间
     例如，如果我们设置两个颜色进行过渡，这个数组中写入0.5，则第一个颜色会在达到layer一半的时候开始向第二个颜色过渡
    @property(nullable, copy) NSArray<NSNumber *> *locations;
   
     //下面两个参数用于设置渲染颜色的起点和终点 取值范围均为0——1
     默认起点为（0.5 ，0） 终点为（0.5 ，1）,颜色的过渡范围就是沿y轴从上向下
    @property CGPoint startPoint;
    @property CGPoint endPoint;
   
     //渲染风格 iOS中只支持一种默认的kCAGradientLayerAxial，我们无需手动设置
    @property(copy) NSString *type;
    */
    
    // 创建曲线,绘制圆形path
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, self.view.center.y) radius:100 startAngle:M_PI endAngle:-M_PI clockwise:NO];
    // 创建shapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.view.bounds;// 设置图层大小
    shapeLayer.path = circlePath.CGPath;// 设置shapeLayer的cgPath
    shapeLayer.opacity = 1.0f;  //设置透明度0~1之间
    shapeLayer.lineCap = kCALineCapRound;//制定线的边缘是圆形
    shapeLayer.lineWidth = 5.0f; // 设置线宽
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;// 设置线条颜色
    [shapeLayer setFillColor:[UIColor clearColor].CGColor]; // 清楚填充颜色
    [self.view.layer addSublayer:shapeLayer];
    
    // 创建颜色数组
    NSMutableArray *colors = [NSMutableArray array];
    for (NSInteger hue = 0; hue <= 360; hue += 5)
    {
        UIColor * color = [UIColor colorWithHue:1.0 * hue / 360
                                     saturation:1.0
                                     brightness:1.0
                                          alpha:1.0];
        [colors addObject:(id)[color CGColor]];
    }
    
    
    CAGradientLayer *grandient = [CAGradientLayer layer];
    grandient.frame = self.view.bounds;//设置颜色渐变的layer的frame
    grandient.colors = colors;//颜色数组
    grandient.mask = shapeLayer;//设置mask图层
    //开始和结束点可以用来做隐式动画
    grandient.startPoint = CGPointMake(0, 0);//开始点
    grandient.endPoint = CGPointMake(1, 0);//结束点
    [self.view.layer addSublayer:grandient];
    
    
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
