//
//  CAReplicatorLayerViewController.m
//  CALayer系列
//
//  Created by 王双龙 on 16/10/10.
//  Copyright © 2016年 http://www.jianshu.com/users/e15d1f644bea All rights reserved.
//

#import "CAReplicatorLayerViewController.h"

@interface CAReplicatorLayerViewController ()

@end

@implementation CAReplicatorLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CAReplicatorLayer";
    [self create];
}

- (void)create{
    
    //CAReplocatorLayer是拷贝视图容器，我们可以通过它，将其中的子layer进行拷贝，并进行一些差异处理
    
    /*CAReplocatorLayer的一些属性
     //拷贝的次数
     @property NSInteger instanceCount;
     //是否开启景深效果
     @property BOOL preservesDepth;
     //当CAReplicatorLayer的子Layer层进行动画的时候，拷贝的副本执行动画的延时
     @property CFTimeInterval instanceDelay;
     //拷贝副本的3D变换
     @property CATransform3D instanceTransform;
     //拷贝副本的颜色变换
     @property(nullable) CGColorRef instanceColor;
     //每个拷贝副本的颜色偏移参数
     @property float instanceRedOffset;
     @property float instanceGreenOffset;
     @property float instanceBlueOffset;
     //每个拷贝副本的透明度偏移参数
     @property float instanceAlphaOffset;
     */
    
    
    CAReplicatorLayer *reLayer = [CAReplicatorLayer layer];
    reLayer.position = CGPointMake(0, 0);
    CALayer * layer= [CALayer layer];
    [reLayer addSublayer:layer];
    [self.view.layer addSublayer:reLayer];
    layer.bounds = CGRectMake(0, 0, 20, 20);
    layer.position = CGPointMake(30, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    //每个副本向右平移25px
    reLayer.instanceTransform=CATransform3DMakeTranslation(25, 5, 0);
    //如果进行动画，副本延时一秒执行
    reLayer.instanceDelay = 1;
    //拷贝十个副本
    reLayer.instanceCount = 10;
    
    
    
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
