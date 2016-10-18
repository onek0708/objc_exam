//
//  NasaConnector.m
//  Nasa
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "Nasa.h"
#import "NasaConnector.h"


@interface NasaConnector()
@property (readonly) NSMutableData *dataCache;
@property NSOperationQueue *sessionQueue;

- (void) initResult;

@end

@implementation NasaConnector

- (void) initResult {
    if (!self.result) {
        self.result = [[NSMutableArray alloc]init];
        NSLog(@"=====> Result allocation OK");
    }
}

- (void) getNasaList:(UpdateFunction)updateFunction:(NSString *)fromDay {
    [self initResult];
    
    NSString *url = @"https://api.nasa.gov/planetary/apod?api_key=MTg0aQMxj8DgcGsoEplsm2wW9SmmKpegOWNUrob4&date=";
    NSString *urlPrefix = @"&hd=false";
    
    NSString *fullUrl = [[url stringByAppendingString:fromDay] stringByAppendingString:urlPrefix];
    
    NSLog(@"%@", fullUrl);
    
    NSURL *listURL = [NSURL URLWithString:fullUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:listURL];
    NSURLSession *jsonSession = [NSURLSession sharedSession]; // URL Singleton
    NSURLSessionDataTask *jsonTask =
    [jsonSession dataTaskWithRequest:request
                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                       NSDictionary *infoDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                options:NSJSONReadingAllowFragments
                                                                                  error:nil];
                      
                       Nasa *newItem = [[Nasa alloc]init];
                       newItem.title = [infoDict valueForKey:@"title"];
                       newItem.desc = [infoDict valueForKey:@"explanation"];
                       newItem.imgUrl = [infoDict valueForKey:@"url"];
                       newItem.hdImgUrl = [infoDict valueForKey:@"hdurl"];
                       newItem.createDate = [infoDict valueForKey:@"date"];
                       
                       [self.result addObject:newItem];

                       updateFunction();
                   }];
    
    [jsonTask resume];
    
//    NSData *nasaList = [NSData dataWithContentsOfURL:listURL];
//    [_dataCache appendData:nasaList];
//    _dataCache = [[NSMutableData alloc]init];

}

- (void) getNasaList:(NSString *)fromDay {
    
    [self initResult];
//
//    if ([self.result objectForKey:fromDay]) {
//        NSLog(@"already load image");
//        return;
//    }
    
    NSString *url = @"https://api.nasa.gov/planetary/apod?api_key=MTg0aQMxj8DgcGsoEplsm2wW9SmmKpegOWNUrob4&date=";
    NSString *urlPrefix = @"&hd=false";
    
    NSString *fullUrl = [[url stringByAppendingString:fromDay] stringByAppendingString:urlPrefix];
    
    NSLog(@"%@", fullUrl);
    NSURL *listURL = [NSURL URLWithString:fullUrl];
    NSData *nasaData = [NSData dataWithContentsOfURL:listURL];
    //NSLog(@"%@", nasaData);
    
    NSDictionary *infoDict = [NSJSONSerialization JSONObjectWithData:nasaData
                                                             options:NSJSONReadingAllowFragments
                                                               error:nil];
    Nasa *newItem = [[Nasa alloc]init];
    newItem.title = [infoDict valueForKey:@"title"];
    newItem.desc = [infoDict valueForKey:@"explanation"];
    newItem.imgUrl = [infoDict valueForKey:@"url"];
    newItem.hdImgUrl = [infoDict valueForKey:@"hdurl"];
    newItem.createDate = [infoDict valueForKey:@"date"];
    
//    [self.result setObject:newItem forKey:fromDay];
    
    [self.result addObject:newItem];
}
@end
