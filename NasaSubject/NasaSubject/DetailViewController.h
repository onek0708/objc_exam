//
//  DetailViewController.h
//  NasaSubject
//
//  Created by Kyunghwa Cheon on 2016. 4. 29..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Nasa.h"

@interface DetailViewController : UIViewController

@property Nasa *detailItem;

- (void)setNasa:(Nasa *)newNasa;

@end

