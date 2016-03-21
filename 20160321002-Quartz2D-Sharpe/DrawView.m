//
//  DrawView.m
//  20160321002-Quartz2D-Sharpe
//
//  Created by Rainer on 16/3/21.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    // 矩形
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) cornerRadius:0];
    
    // 圆角矩形
    UIBezierPath *bezierPath2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) cornerRadius:10];
    
    // 圆角矩形（圆形）
    UIBezierPath *bezierPath3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) cornerRadius:100];

    // 圆弧
    UIBezierPath *bezierPath4 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(125, 125) radius:100 startAngle:0 endAngle:-M_PI * 0.5 clockwise:NO];
    
    // 扇形
    CGPoint centerPiont = CGPointMake(125, 125);
    
    // ArcCenter:圆心
    // radius:半径
    // startAngle:起始角度（弧度值）
    // endAngle:结束角度（弧度值）
    // clockwise:是否顺时针：YES代表顺时针，NO代表逆时针
    UIBezierPath *bezierPath5 = [UIBezierPath bezierPathWithArcCenter:centerPiont radius:100 startAngle:0 endAngle:M_PI * 0.5 clockwise:YES];
    
    [bezierPath5 addLineToPoint:centerPiont];
    // 如果使用填充模式（fill），则不需要手动关闭路径
//    [bezierPath5 closePath];
    
    // 描边
//    [bezierPath5 stroke];
    
    // 填充：必须是一个封闭的路径
    [bezierPath5 fill];
}

/**
 *  使用CGContext画线，路径只能有一个
 */
- (void)drawUseCGContext {
    // 1.获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
    // 2.1.创建一个起点
    CGContextMoveToPoint(contextRef, 50, 50);
    
    // 2.2.画一条线到某个点
    CGContextAddLineToPoint(contextRef, 200, 50);
    CGContextAddLineToPoint(contextRef, 200, 200);
    
    // 画一条不相连接的线
    CGContextMoveToPoint(contextRef, 220, 220);
    CGContextAddLineToPoint(contextRef, 235, 235);
    
    // 3.设置上下文状态
    [[UIColor redColor] set];
    CGContextSetLineWidth(contextRef, 14);
    CGContextSetLineCap(contextRef, kCGLineCapRound);
    CGContextSetLineJoin(contextRef, kCGLineJoinBevel);
    
    // 4.渲染上下文
    CGContextStrokePath(contextRef);
}

/**
 *  使用UIBezierPath画线
 */
- (void)drawLineUseBezierPath {
    // 创建一个贝赛尔对象
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    // 设置起点
    [bezierPath moveToPoint:CGPointMake(50, 50)];
    
    // 画线到某一点
    [bezierPath addLineToPoint:CGPointMake(50, 200)];
    
    // 设置状态
    [bezierPath setLineCapStyle:kCGLineCapRound];
    [bezierPath setLineWidth:14];
    [bezierPath setLineJoinStyle:kCGLineJoinBevel];
    
    // 渲染路径
    [bezierPath stroke];
    
    // 创建一个贝赛尔对象
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPath];
    
    // 设置起点
    [bezierPath1 moveToPoint:CGPointMake(50, 200)];
    
    // 画线到某一点
    [bezierPath1 addLineToPoint:CGPointMake(200, 200)];
    
    // 设置状态
    [bezierPath1 setLineCapStyle:kCGLineCapRound];
    [bezierPath1 setLineWidth:1];
    [bezierPath1 setLineJoinStyle:kCGLineJoinBevel];
    [[UIColor redColor] setStroke];
    
    // 渲染路径
    [bezierPath1 stroke];
}

/**
 *  使用UIBezierPath画曲线
 *  controlPoint:控制点
 */
- (void)drawQuadCurveUseUIBezierPath {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:CGPointMake(50, 200)];
    
    [bezierPath addQuadCurveToPoint:CGPointMake(200, 200) controlPoint:CGPointMake(100, 1)];
    
    [bezierPath stroke];
}

/**
 *  使用UIBezierPath画曲线
 *  cpx:控制点的x，cpy:控制点的y
 */
- (void)drawQuadCurveUseCGContext {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(contextRef, 50, 200);
    
    CGContextAddCurveToPoint(contextRef, 100, 1, 101, 1,200, 200);
    
    CGContextStrokePath(contextRef);
}

@end
