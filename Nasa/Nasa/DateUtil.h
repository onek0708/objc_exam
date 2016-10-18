//
//  DateUtil.h
//  Nasa
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

+ (NSString *) getToday;
+ (NSString *) getDay:(int)previous;

@end
