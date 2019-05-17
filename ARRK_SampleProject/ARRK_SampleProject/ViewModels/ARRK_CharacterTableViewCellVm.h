//
//  ARRK_CharacterTableViewCellVm.h
//  ARRK_SampleProject
//
//  Created by Kogila on 17/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARRK_Character.h"
@interface ARRK_CharacterTableViewCellVm : NSObject
@property (nonatomic) NSUInteger uniqueId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *thumbnailUrl;
@property (nonatomic,strong) NSData *imageData;
- (id)initWithCharacterObject:(ARRK_Character *)character;

@end

