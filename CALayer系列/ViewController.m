//
//  ViewController.m
//  CALayer系列
//
//  Created by 王双龙 on 16/10/10.
//  Copyright © 2016年 http://www.jianshu.com/users/e15d1f644bea All rights reserved.
//

#import "ViewController.h"
#import "CAEmitterLayerViewController.h"
#import "CAGradientLayerViewController.h"
#import "CAReplicatorLayerViewController.h"
#import "CAShapeLayerViewController.h"
#import "CATextLayerViewController.h"
#import "CGContextRefViewController.h"
#import "UIBezierPathViewController.h"
#import "AttributesViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray * _array;
}

@end

@implementation ViewController

/*CALayer内部的一些属性
 // 宽度和高度
 @propertyCGRectbounds;
 
 // 位置(默认指中点，具体由anchorPoint决定)
 @propertyCGPointposition;
 
 // 锚点(x,y的范围都是0-1)，决定了position的含义
 @propertyCGPointanchorPoint;
 
 // 背景颜色(CGColorRef类型)
 @propertyCGColorRefbackgroundColor;
 
 // 形变属性
 @propertyCATransform3Dtransform;
 
 // 边框颜色(CGColorRef类型)
 @propertyCGColorRefborderColor;
 
 // 边框宽度
 @propertyCGFloatborderWidth;
 
 // 圆角半径
 @propertyCGColorRefborderColor;
 
 // 内容(比如设置为图片CGImageRef)
 @property(retain)idcontents;
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = @[@"CAEmitterLayer", @"CAGradientLayer",@"CAReplicatorLayer",@"CAShapeLayer",@"CATextLayer",@"CGContextRef",@"UIBezierPath",@"文本属性Attributes"];
    
    UITableView * tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    
}

#pragma mark -- UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
  return  _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    
    cell.textLabel.text = _array[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray * arr = @[[CAEmitterLayerViewController class],[CAGradientLayerViewController class],[CAReplicatorLayerViewController class],[CAShapeLayerViewController class],[CATextLayerViewController class],[CGContextRefViewController class],[UIBezierPathViewController class],[AttributesViewController class]];
    
       [self createCAEmitterLayer:(UIViewController *)arr[indexPath.row]];
}

- (void)createCAEmitterLayer:(id)class{
    
   UIViewController * vc = [[class alloc] init];
    
    [self.navigationController pushViewController:vc animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
