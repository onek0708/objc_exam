//
//  Nasa.h
//  Nasa
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 1. MasterVC
 
 썸네일과 제목, 날짜를 표시합니다.
 
 
 
 2. DetailVC
 
 제목, 이미지, 설명, 저작권을 표시합니다.
 
 크게보기 버튼을 누르면 모달로 HD 이미지가 100% 크기로 나타납니다.
 노트 버튼을 누르면 노트를 적을 수 있는 모달 뷰가 올라옵니다.
 노트는 뷰의 아래쪽에 표시됩니다.
 노트는 저장됩니다.
 
*/

@interface Nasa : NSObject

@property NSString *imgUrl;
@property NSString *title;
@property NSString *createDate;

@property NSString *desc;
@property NSString *hdImgUrl;
@property NSString *license;

@property UIImage *downloadedImg;

@end
