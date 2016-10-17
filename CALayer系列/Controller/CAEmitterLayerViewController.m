//
//  CAEmitterLayerViewController.m
//  CALayer系列
//
//  Created by 王双龙 on 16/10/10.
//  Copyright © 2016年 http://www.jianshu.com/users/e15d1f644bea All rights reserved.
//

#import "CAEmitterLayerViewController.h"

@interface CAEmitterLayerViewController ()
{
    CAEmitterLayer * _snowEmitter;//发射器对象
}
@end

@implementation CAEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CAEmitterLayer";
    self.view.backgroundColor = [UIColor blackColor];
    
    [self create];
    
}

- (void)create{
    
    
    //设置发射器
    _snowEmitter=[[CAEmitterLayer alloc]init];
    //发射器在xy平面的中心位置
    _snowEmitter.emitterPosition=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    //发射器的尺寸大小
    _snowEmitter.emitterSize=CGSizeMake(20, 20);
    //发射器的渲染模式
    /*
     kCAEmitterLayerUnordered //这种模式下，粒子是无序出现的，多个发射源将混合
     kCAEmitterLayerOldestFirst //这种模式下，声明久的粒子会被渲染在最上层
     kCAEmitterLayerOldestLast //这种模式下，年轻的粒子会被渲染在最上层
     kCAEmitterLayerBackToFront //这种模式下，粒子的渲染按照Z轴的前后顺序进行
     kCAEmitterLayerAdditive //这种模式会进行粒子混合
     */
    _snowEmitter.renderMode = kCAEmitterLayerBackToFront;
    
    /*emitterShape
     kCAEmitterLayerPoint //点的形状，粒子从一个点发出
     kCAEmitterLayerLine  //线的形状，粒子从一条线发出
     kCAEmitterLayerRectangle //矩形形状，粒子从一个矩形中发出
     kCAEmitterLayerCuboid //立方体形状，会影响Z平面的效果
     kCAEmitterLayerCircle //圆形，粒子会在圆形范围发射
     kCAEmitterLayerSphere //球型
     */
    _snowEmitter.emitterShape = kCAEmitterLayerPoint;
    _snowEmitter.preservesDepth = YES;
    
    /*发射器的发射模式
     kCAEmitterLayerPoints //从发射器中发出
     kCAEmitterLayerOutline //从发射器边缘发出
     kCAEmitterLayerSurface //从发射器表面发出
     kCAEmitterLayerVolume //从发射器中点发出
     */
    _snowEmitter.emitterMode = kCAEmitterLayerVolume;
    
    /*下面是_snowEmitter的一些属性
     _snowEmitter.birthRate //粒子的创建速率，默认为1/s
     lifetime 粒子的存活时间。默认为1S
     emitterZPosition 发射器在Z平面的位置
     emitterDepth  发射器的深度，在某些发射模式下会产生立体效果
     emitterShape  发射器的形状
     emitterMode  发射器的发射模式
     preservesDepth 是否开启三维空间效果
     velocity 粒子的运动速度
     scale 粒子的缩放大小
     spin 粒子的旋转位置
     seed 初始化随机的粒子种子
     */
    
    
    //发射单元
    //火焰
    CAEmitterCell * snow = [CAEmitterCell emitterCell];
    //粒子的创建速率
    snow.birthRate = 22;
    //粒子的生存时间
    snow.lifetime = 2.0;
    //粒子的生存时间容差
    snow.lifetimeRange = 1.5;
    //粒子的颜色
    snow.color = [[UIColor whiteColor]CGColor];
    //渲染粒子，可以设置为一个CGImage的对象
    snow.contents = (id)[[UIImage imageNamed:@"snow.png"]CGImage];
    //设置发射单元的名称
    snow.name = @"snow";
    //粒子的速度
    snow.velocity=160;
    //粒子速度的容差
    snow.velocityRange=80;
    //粒子在xy平面的发射角度
    snow.emissionLongitude= M_PI/2;
    //粒子发射角度的容差
    snow.emissionRange=M_PI/2;
    //缩放速度
    snow.scaleSpeed=0.3;
    //旋转度
    snow.spin=0.2;
    
    /*下面是snow的一些属性
     
     xAcceleration/yAcceleration/zAcceleration; x，y，z三个方向的加速度
     contentsRect 渲染的范围
     
     @property float redRange;
     @property float greenRange;
     @property float blueRange;
     @property float alphaRange;
     粒子在rgb三个色相上的容差和透明度的容差
     
     @property float redSpeed;
     @property float greenSpeed;
     @property float blueSpeed;
     @property float alphaSpeed;
     粒子在RGB三个色相上的变化速度和透明度的变化速度
     
     */
    
    
    //粒子单元数组
    _snowEmitter.emitterCells = [NSArray arrayWithObjects:snow,nil];
    [self.view.layer addSublayer:_snowEmitter];
    
    
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
