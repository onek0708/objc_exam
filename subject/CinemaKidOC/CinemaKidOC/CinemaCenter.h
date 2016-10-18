//
//  CinemaCenter.h
//  CinemaKidOC
//
//  Created by Kyunghwa Cheon on 2016. 4. 26..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaCenter : NSObject

@property NSArray *result;

- (void) requestToServer;
- (void) requestToServer:(void (^)(void))updateFunction ;
@end
