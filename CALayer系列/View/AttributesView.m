//
//  AttributesView.m
//  CALayer系列
//
//  Created by 王双龙 on 16/10/14.
//  Copyright © 2016年 http://www.jianshu.com/users/e15d1f644bea All rights reserved.
//

#import "AttributesView.h"

@implementation AttributesView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    
    
    //关于文本属性Attributes的详细介绍可以到这里http://www.jianshu.com/p/3f191880a567
    
    //段落的样式
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    
//        paragraphStyle.lineSpacing = 10;// 字体的行间距
//    
//        paragraphStyle.firstLineHeadIndent = 20.0f;//首行缩进
//    
//        paragraphStyle.alignment = NSTextAlignmentJustified;//（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
//    
//        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
//    
//        paragraphStyle.headIndent = 20;//整体缩进(首行除外)
//    
//        paragraphStyle.tailIndent = 20;//尾部缩进
//    
//        paragraphStyle.minimumLineHeight = 20;//最低行高
//    
//        paragraphStyle.maximumLineHeight = 20;//最大行高
//    
//        paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
//    
//        paragraphStyle.paragraphSpacingBefore = 22.0f;//段首行空白空间/* Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph. */
//    
//        paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;//从左到右的书写方向（一共➡️⬇️⬅️三种）
//    
//        paragraphStyle.lineHeightMultiple = 15;/* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
//    
//        //paragraphStyle.hyphenationFactor = 1;//连字属性 在iOS，唯一支持的值分别为0和1
    
    
    
    //文字居中显示在画布
    NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment=NSTextAlignmentCenter;//文字居中
    
    NSString *string  = @"且行且珍惜_iOS";
    /*
     
     NSKernAttributeName(文字间距) : @8
     NSFontAttributeName(字体设置)
     NSForegroundColorAttributeName(字体颜色)
     NSParagraphStyleAttributeName(段落样式)
     NSBackgroundColorAttributeName(背景颜色)
     NSStrokeColorAttributeName(字体边框颜色)和NSStrokeWidthAttributeName（字体边框的宽度），字体边框的宽度是按照和字体的大小进行比例设置的.这两个属性设置完成之后会出现两种效果,如果NSStrokeWidthAttributeName为负数,那么字体为描边,如果NSStrokeWidthAttributeName为正整数,字体的效果就成了空心字.值得注意的是,这两个属性必须要配合着使用,只设置一方面是不能实现效果的。
     NSStrikethroughStyleAttributeName（删除线）：@(NSUnderlineStyleSingle)
     NSUnderlineStyleAttributeName(下划线) ：@(NSUnderlineStyleSingle)
     NSUnderlineColorAttributeName  设置下划线颜色
     NSVerticalGlyphFormAttributeName(文字排版方向) ：@0 ；0表示横排 ，1代表竖排  (没看到效果)
     NSObliquenessAttributeName(文字倾斜) ： @5；
     NSExpansionAttributeName(文字扁平化) ：@1；
     NSShadowAttributeName(文字阴影) :shadow
     NSShadowAttributeName对应的是NSShadow对象,单一使用不会有任何效果,需要配合着NSVerticalGlyphFormAttributeName(文字排版方向)、NSObliquenessAttributeName(文字倾斜)、NSExpansionAttributeName(文字扁平化)配合使用
     NSWritingDirectionAttributeName（设置文字书写方向）:@(NSWritingDirectionRightToLeft) （没看到效果）
     NSLinkAttributeName  设置链接属性，点击后调用浏览器打开指定URL地址
     NSAttachmentAttributeName          设置文本附件,取值为NSTextAttachment对象,常用于文字图片混排

     */
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 1;//模糊度
    shadow.shadowColor = [UIColor grayColor];//阴影颜色
    shadow.shadowOffset = CGSizeMake(1, 5);//阴影的大小
    
    [string drawInRect:CGRectMake(50, 100, 200, 400) withAttributes:@{
                                                                      NSFontAttributeName:[UIFont systemFontOfSize:25],
                                                                      NSForegroundColorAttributeName:[UIColor blackColor],
                                                                      NSVerticalGlyphFormAttributeName : @(1),
                                                                      NSObliquenessAttributeName : @1,
                                                                      NSExpansionAttributeName : @0.5,
                                                                      NSShadowAttributeName :shadow,
                                                                      NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
                                                                      NSStrikethroughColorAttributeName : [UIColor redColor],
                                                                      NSStrokeColorAttributeName : [UIColor orangeColor] ,
                                                 NSStrokeWidthAttributeName :@-3}];
    
}


@end
