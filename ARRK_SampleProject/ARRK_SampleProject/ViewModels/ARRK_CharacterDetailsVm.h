//
//  ARRK_CharacterDetailsVm.h
//  ARRK_SampleProject
//
//  Created by Kogila on 16/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARRK_Character.h"
@interface ARRK_CharacterDetailsVm : NSObject
@property (nonatomic) NSUInteger uniqueId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSURL *thumbnailUrl;
@property (nonatomic,strong) NSString *pathExtension;
@property (nonatomic,strong) NSString *biography;
@property (nonatomic,strong) NSArray *listOfComics;

-(id)initWithCharacter:(ARRK_Character *)character;
@end
