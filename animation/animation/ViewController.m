//
//  ViewController.m
//  animation
//
//  Created by Kyunghwa Cheon on 2016. 4. 26..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *movingView;
- (IBAction)move:(id)sender;

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

- (IBAction)move:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    
    CGPoint prev = self.movingView.center;
    UIColor *prevColor = self.movingView.backgroundColor;
    
    [UIView animateWithDuration:2 animations:^{
        self.movingView.center = CGPointMake(300, 500);
        self.movingView.backgroundColor = [UIColor blueColor];
        self.movingView.transform = CGAffineTransformMakeRotation(M_PI_4 *3);
        
        button.transform = CGAffineTransformMakeRotation(M_PI_4 *3);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2 animations:^{
            self.movingView.center = prev;
            self.movingView.backgroundColor = prevColor;
            self.movingView.transform = CGAffineTransformIdentity;
            button.transform = CGAffineTransformIdentity;
            
        }];
    }];
    
}
@end
