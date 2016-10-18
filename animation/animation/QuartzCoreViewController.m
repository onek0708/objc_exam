//
//  QuartzCoreViewController.m
//  animation
//
//  Created by Kyunghwa Cheon on 2016. 4. 26..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "QuartzCoreViewController.h"

@interface QuartzCoreViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *helliImageView;
- (IBAction)fly:(id)sender;
- (IBAction)moveToPath:(id)sender;

@end

@implementation QuartzCoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.helliImageView.animationImages = @[
                                            [UIImage imageNamed:@"heli_1"],
                                            [UIImage imageNamed:@"heli_2"],
                                            [UIImage imageNamed:@"heli_3"],
                                            [UIImage imageNamed:@"heli_4"],
                                            [UIImage imageNamed:@"heli_5"],
                                            [UIImage imageNamed:@"heli_6"],
                                           ];
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

- (IBAction)fly:(id)sender {
    [self.helliImageView startAnimating];
}

- (IBAction)moveToPath:(id)sender {
    CGPoint currCenter = self.helliImageView.center;
    CGPoint dest = CGPointMake(300, 500);
    
    // 패스 만들기
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:currCenter];
    [path addCurveToPoint:dest controlPoint1:CGPointMake(-100, currCenter.y) controlPoint2:CGPointMake(550, dest.y)];
    
    // 키프레임 에니메이션 CA=Core Animation
    CAKeyframeAnimation *keyAni = [CAKeyframeAnimation animation];
    keyAni.path = path.CGPath;
    keyAni.duration = 4;
    
    [self.helliImageView.layer addAnimation:keyAni forKey:@"position"];
}
@end
