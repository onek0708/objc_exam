//
//  NasaConnector.h
//  Nasa
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^UpdateFunction)(void);

@interface NasaConnector : NSObject

//@property NSMutableDictionary *result;

@property NSMutableArray *result;

- (void) getNasaList:(UpdateFunction)updateFunction:(NSString *)fromDay;
- (void) getNasaList:(NSString *)fromDay;

@end
