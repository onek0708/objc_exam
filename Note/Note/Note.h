//
//  Note.h
//  Note
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

// setter의 동작 방식
// (copy) : 포인터라도 대입시 복사 다만 NSCopying 프로토콜이 구현되어 있어야 한다.
// (retain) : 포인터 시  ARC retain count 를 증가시킨다.
// (assign) -> (unsafe_unretained) : 포인터 값만 복사

@property NSString *title;
@property NSString *content;
@property NSDate   *creationDate;

@end
