//
//  Note.m
//  Note
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "Note.h"

@interface Note() <NSCoding>

@end


@implementation Note

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    
    //NSString는 예외적인 경우가 많아 코코아 특성을 설명할때 좋지 않음(자체 예외처리가 잘되있음)
    
    
    if (self) {
        
        // self.title 은 self.setTitle: 을 호출하는 것과 마찬가지이며 setTitle 은 내부적으로 retain count를 증가 시킨다.
        // retain 은 +1 ARC Count 증가
        
        self.title = [coder decodeObjectForKey:@"title"];
        self.content = [coder decodeObjectForKey:@"content"];
        self.creationDate = [coder decodeObjectForKey:@"creationDate"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.content forKey:@"content"];
    [coder encodeObject:self.creationDate forKey:@"creationDate"];
}
@end
