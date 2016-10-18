//
//  PopupViewController.m
//  NasaSubject
//
//  Created by Kyunghwa Cheon on 2016. 4. 29..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "PopupViewController.h"

@interface PopupViewController ()

@property NSString *hdImageUrl;
@property (weak, nonatomic) IBOutlet UIImageView *hdImageContent;
@property NSOperationQueue *thumbnailQueue;
@end

@implementation PopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.thumbnailQueue = [[NSOperationQueue alloc]init];
    [self loadHdImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadHdImage {
    
    NSLog(@"HD Image %@", self.hdImageUrl);
    
    NSBlockOperation *thumbnatilUpdateOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSData *posterData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.hdImageUrl]];
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            UIImage *posterImage = [UIImage imageWithData:posterData];
            self.hdImageContent.image = posterImage;
        }];
    }];
    [self.thumbnailQueue addOperation:thumbnatilUpdateOperation];
}

- (void) setHdUrl:(NSString *)hdImageUrl
{
    self.hdImageUrl = hdImageUrl;
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
