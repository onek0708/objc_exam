//
//  ViewController.m
//  Note
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SubViewSize.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGSize subSize = [self.view subViewSize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
