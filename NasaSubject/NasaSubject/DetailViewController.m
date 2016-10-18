//
//  DetailViewController.m
//  NasaSubject
//
//  Created by Kyunghwa Cheon on 2016. 4. 29..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "DetailViewController.h"
#import "PopupViewController.h"
#import "Nasa.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *imgTitle;
@property (nonatomic) IBOutlet UIImageView *imgContent;

@property (weak, nonatomic) IBOutlet UILabel *imgCreateDate;

@property (weak, nonatomic) IBOutlet UITextView *imgNote;
@property (weak, nonatomic) IBOutlet UITextView *imgDesc;

@property (weak, nonatomic) IBOutlet UILabel *imgLicense;
@property NSOperationQueue *thumbnailQueue;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setNasa:(Nasa *)newNasa {
    
    if (self.detailItem != newNasa) {
        self.detailItem = newNasa;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    if (self.detailItem) {
        Nasa *item = (Nasa *)self.detailItem;
        self.imgTitle.text = item.title;
        self.imgDesc.text = item.desc;
        self.imgCreateDate.text = item.createDate;
        self.imgLicense.text = item.license;
    }
}

- (void)loadImage {
    NSBlockOperation *thumbnatilUpdateOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSData *posterData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.detailItem.imgUrl]];
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            UIImage *posterImage = [UIImage imageWithData:posterData];
            self.imgContent.image = posterImage;
        }];
    }];
    [self.thumbnailQueue addOperation:thumbnatilUpdateOperation];

    
//    self.imgContent.image = self.detailItem.downloadedImg;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.thumbnailQueue = [[NSOperationQueue alloc]init];
    
    [self configureView];
    [self loadImage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showPopup"]) {
        
        [self.thumbnailQueue cancelAllOperations];
        
        PopupViewController *controller = (PopupViewController *)[segue destinationViewController];
        [controller setHdUrl:self.detailItem.hdImgUrl];
    }
}

-(IBAction) closeHdPopupImage:(UIStoryboardSegue *)segue {
    
    NSString *identifier = segue.identifier;
    
    if ([identifier isEqualToString:@"createNote"]) {
        
    }
    
}

@end
