//
//  NoteDocument.m
//  Note
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "NoteDocument.h"
#import "Note.h"

@implementation NoteDocument

// + 는 static method
// - 는 normal method

-(instancetype)init {
    self = [super init];
    
    if (self) {
        // {Type}         {Class Object}
            Note *newNote = [[Note alloc]init];
    }
    
    return self;
}

// 저장을 위한 메소드
// 저정할 데이터를 담은 NSData를 리턴
- (id)contentsForType:(NSString *)typeName error:(NSError * _Nullable __autoreleasing *)outError {

    // case one data
    //NSData *oneSingData = [NSKeyedArchiver archivedDataWithRootObject:self.noteArray];
    
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:self.noteArray forKey:@"note"];
    [archiver finishEncoding];
    
    return data;
}

- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError * _Nullable __autoreleasing *)outError {
    if ([contents length] > 0) {
        NSData *data = (NSData *)contents;
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        
        NSArray *unarchArray = [unarchiver decodeObjectForKey:@"note"];
        self.noteArray = [[NSMutableArray alloc] initWithArray:unarchArray];
        
    }
    
    
    return YES;
}


@end
