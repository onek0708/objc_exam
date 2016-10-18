//
//  CinemaCenter.m
//  CinemaKidOC
//
//  Created by Kyunghwa Cheon on 2016. 4. 26..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "CinemaCenter.h"


@interface CinemaCenter() // private Header


@property (readonly) NSMutableData *dataCache;
@property NSOperationQueue *sessionQueue;

@end

typedef void (^UpdateFunction)(void);

@implementation CinemaCenter

- (void) requestToServer {
    NSURL *listUrl = [NSURL URLWithString:@"http://125.209.197.227/cinemakid/movie/list"];
    
    // XML Parser
    // NSXMLParser : SAX, // TouchXML, TinyXML, KissXML : DOM
    // libxml2 : SAX, DOM
    
    NSData *movieListData = [NSData dataWithContentsOfURL:listUrl];
    
    NSDictionary *infoDict = [NSJSONSerialization JSONObjectWithData:movieListData
                                                             options:NSJSONReadingAllowFragments
                                                               error:nil];
    self.result = [infoDict valueForKey:@"data"];
    
    
    
}

- (void) requestToServer:(UpdateFunction)updateFunction {
    NSURL *listURL = [NSURL URLWithString:@"http://125.209.197.227/cinemakid/movie/list"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:listURL];
    NSURLSession *jsonSession = [NSURLSession sharedSession]; // URL Singleton
    NSURLSessionDataTask *jsonTask = [jsonSession dataTaskWithRequest:request
                                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *infoDict = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:nil];
        
        self.result = [infoDict valueForKey:@"data"];
        
        updateFunction();
    }];
    
    [jsonTask resume];
    
    // Test Code for ReadOnly
    // Readonly 는 setter 가 제공되지 않는다.
//    NSData *movieListData = [NSData dataWithContentsOfURL:listURL];
//    [_dataCache appendData:movieListData];
//    self.dataCache = [[NSMutableData alloc]init]; <-- impossible , 포인터를 바꾸는게 불가
//    [self.dataCache [NSMutableData alloc]init];  //<-- readonly 는 setter가 제공되지 않는다.
//    _dataCache = [[NSMutableData alloc]init]; // <-- posible , 내부에서 _dataCache 로 접근해서 수정은 가능
}
                                
@end
