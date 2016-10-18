//
//  GestureViewController.m
//  Example1
//
//  Created by Kyunghwa Cheon on 2016. 4. 25..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "GestureViewController.h"


@interface GestureViewController() <UIGestureRecognizerDelegate>
//{
//    UIImageView *_idoImageView;
//}
//
//-(UIImageView *)idolImageView;
//-(void)setIdolImageView:(UIImageView *)newImageView;

@property (weak, nonatomic) IBOutlet UIImageView *idolImageView;

- (IBAction)imageTap:(id)sender;
- (IBAction)imagePan:(id)sender;

@end

@implementation GestureViewController


- (IBAction)imageTap:(UITapGestureRecognizer *)sender {
    NSLog(@"Image Tab");
}

- (IBAction)imagePan:(UIPanGestureRecognizer *)gestureRecognizer {
    
    CGPoint translation = [gestureRecognizer translationInView:self.view];
    
    CGPoint newCenter;
    
//    _idolImageView.center = newCenter;
//  self.idolImageView.center = newCenter;
    [[self idolImageView] setCenter:newCenter];
    
    [self.idolImageView performSelector:@selector(setCenter:) withObject:nil afterDelay:5];
    
    id whoami = self.idolImageView;
    
    BOOL isitView = [whoami isKindOfClass:[UIView class]];
    BOOL isGestureVN = [self respondsToSelector:@selector(idolImageView)];
    NSLog(@"image pan");
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
@end
