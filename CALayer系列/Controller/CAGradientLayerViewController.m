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
    
    CAGradientLayer * layer = [CAGradientLayer layer];
    layer.colors = @[(id)[UIColor whiteColor].CGColor,(id)[UIColor blueColor].CGColor,(id)[UIColor greenColor].CGColor];
    
    layer.locations = @[@0.1,@0.5,@1];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(50, 50);
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    //[self.view.layer addSublayer:layer];
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.layer.cornerRadius = 50;
    view.clipsToBounds = YES;
    [self.view addSubview:view];
    [view.layer addSublayer:layer];
    
    
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
