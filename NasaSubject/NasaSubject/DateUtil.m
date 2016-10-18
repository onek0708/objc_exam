//
//  DateUtil.m
//  Nasa
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

+ (NSString *) getToday {
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    [fmt setDateFormat:@"YYYY-MM-dd"];
    return [fmt stringFromDate:[NSDate date]];
}

+ (NSString *) getDay:(int)previous {
    NSTimeInterval secondsPerDay = (24 * previous) * 60 * 60;
    
    NSDate *today = [[NSDate alloc] init];
    NSDate *ret = [today dateByAddingTimeInterval: -secondsPerDay];
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    [fmt setDateFormat:@"YYYY-MM-dd"];
    return [fmt stringFromDate:ret];
}

@end
