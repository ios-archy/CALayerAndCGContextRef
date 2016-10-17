//
//  CATextLayerViewController.m
//  CALayer系列
//
//  Created by 王双龙 on 16/10/10.
//  Copyright © 2016年 http://www.jianshu.com/users/e15d1f644bea All rights reserved.
//

#import "CATextLayerViewController.h"

@interface CATextLayerViewController ()

@end

@implementation CATextLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CATextLayer";
    
    [self create];
    
}

- (void)create{
    
    /*
     CATextLayer可以进行文本的绘制,属性如下：
     //渲染的文字字符串
     @property(nullable, copy) id string;
     //设置字体
     @property(nullable) CFTypeRef font;
     //设置字号
     @property CGFloat fontSize;
     //设置文字颜色
     @property(nullable) CGColorRef foregroundColor;
     //是否换行
     @property(getter=isWrapped) BOOL wrapped;
     /*
     设置截断模式
     NSString * const kCATruncationNone;
     截断前部分
     NSString * const kCATruncationStart;
     截断后部分
     NSString * const kCATruncationEnd;
     截断中间
     NSString * const kCATruncationMiddle;
     */
   // @property(copy) NSString *truncationMode;
    /*
     设置文字对齐模式
     NSString * const kCAAlignmentNatural;
     NSString * const kCAAlignmentLeft;
     NSString * const kCAAlignmentRight;
     NSString * const kCAAlignmentCenter;
     NSString * const kCAAlignmentJustified;
     */
   // @property(copy) NSString *alignmentMode;

    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame =CGRectMake(100,100,100,100);
    [self.view.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode =kCAAlignmentJustified;
    textLayer.wrapped =YES;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFontRef fontRef =CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    textLayer.string =  @"http://www.jianshu.com/users/e15d1f644bea";
    
    //使用CATextLayer设置文本，可能会产生模糊状态，因为该默认的分辨率不是retina
      textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    
    
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
