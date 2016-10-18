//
//  DetailViewController.h
//  CoreDataTest
//
//  Created by Kyunghwa Cheon on 2016. 4. 27..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

