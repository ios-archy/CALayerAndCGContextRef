//
//  UIBezierPathViewController.m
//  CALayer系列
//
//  Created by 王双龙 on 16/10/13.
//  Copyright © 2016年 http://www.jianshu.com/users/e15d1f644bea All rights reserved.
//

#import "UIBezierPathViewController.h"
#import "UIBezierPathView.h"

@interface UIBezierPathViewController ()

@end

@implementation UIBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"UIBezierPath";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBezierPathView * view = [[UIBezierPathView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    
       
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
