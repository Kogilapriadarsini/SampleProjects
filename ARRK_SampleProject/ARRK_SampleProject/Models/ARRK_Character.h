//
//  ARRK_Character.h
//  ARRK_SampleProject
//
//  Created by Kogila on 16/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARRK_Character : NSObject
@property (nonatomic) NSUInteger uniqueId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *thumbnailUrl;
@property (nonatomic,strong) NSString *pathExtension;
@property (nonatomic,strong) NSString *biography;
@property (nonatomic,strong) NSArray *listOfComics;
@end

