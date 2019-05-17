//
//  ARRK_CharacterDetailsVm.m
//  ARRK_SampleProject
//
//  Created by Kogila on 16/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import "ARRK_CharacterDetailsVm.h"

@implementation ARRK_CharacterDetailsVm
-(id)initWithCharacter:(ARRK_Character *)character
{
    self = [self init];
    if (self)
    {
        self.thumbnailUrl =  [NSURL URLWithString:[NSString stringWithFormat:@"%@.%@",character.thumbnailUrl,character.pathExtension]];
        self.name = character.name;
        self.uniqueId = character.uniqueId;
        self.biography = character.biography;
        self.listOfComics = character.listOfComics;
    }
    return self;
}
@end
