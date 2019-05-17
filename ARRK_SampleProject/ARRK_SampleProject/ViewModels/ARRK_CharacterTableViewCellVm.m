//
//  ARRK_CharacterTableViewCellVm.m
//  ARRK_SampleProject
//
//  Created by Kogila on 17/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import "ARRK_CharacterTableViewCellVm.h"
#import "ARRK_WebServiceProtocol.h"
@interface ARRK_CharacterTableViewCellVm()

@end
@implementation ARRK_CharacterTableViewCellVm
- (id)initWithCharacterObject:(ARRK_Character *)character
{
    self = [self init];
    if (self)
    {
        self.thumbnailUrl =  [NSString stringWithFormat:@"%@.%@",character.thumbnailUrl,character.pathExtension];
        self.name = character.name;
        self.uniqueId = character.uniqueId;
    }
    return self;
}
@end
