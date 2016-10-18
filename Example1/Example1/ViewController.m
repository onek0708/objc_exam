//
//  ViewController.m
//  Example1
//
//  Created by Kyunghwa Cheon on 2016. 4. 25..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *canvasView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    CGPoint position = [touches.anyObject locationInView:self.view];
//    NSLog(@"%s, %f, %f", __FUNCTION__, position.x, position.y);
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint position = [touches.anyObject locationInView:self.view];
    CGPoint prevPosition = [touches.anyObject previousLocationInView:self.view];
    
    [self drawFromStartPoint:[self.view convertPoint:prevPosition toView:self.canvasView] to:[self.view convertPoint:position toView:self.canvasView]];
    /*
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:prevPosition];
    [path addLineToPoint:position];
    
    [path stroke];
    NSLog(@"%s, %f, %f", __FUNCTION__, position.x, position.y);
     */
    
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    CGPoint position = [touches.anyObject locationInView:self.view];
//    NSLog(@"%s, %f, %f", __FUNCTION__, position.x, position.y);
}

-(void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    CGPoint position = [touches.anyObject locationInView:self.view];
//    NSLog(@"%s, %f, %f", __FUNCTION__, position.x, position.y);
}

-(void)drawFromStartPoint:(CGPoint)start to:(CGPoint) destination {
    // CoreGraphics
    
    UIGraphicsBeginImageContext(self.canvasView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 현재 이미지 그리기
    CGRect canvasRect = CGRectMake(0,0, self.canvasView.frame.size.width, self.canvasView.frame.size.height);
    [self.canvasView.image drawInRect:canvasRect];
    
    // 그리기 환경 설정
    CGContextSetLineWidth(context, 3.0);
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    
    // 새로운 라인 그리기
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, start.x, start.y);
    CGContextAddLineToPoint(context, destination.x, destination.y);
    CGContextStrokePath(context);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.canvasView.image = newImage;
    
    
}

@end
