//
//  ARRK_CharactersListVm.h
//  ARRK_SampleProject
//
//  Created by Kogila on 16/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARRK_CharacterTableViewCellVm.h"
@protocol ARRK_CharactersListVmDelegate<NSObject>
-(void)didFinishFetchingCharacters;
-(void)didFailFetchingCharacterWithError:(NSError *)error;
@end

@interface ARRK_CharactersListVm : NSObject
-(id)initWithDelegate:(id<ARRK_CharactersListVmDelegate>)delegate;
-(void)fetchCharactersList;
-(NSInteger)dataCount;
-(ARRK_CharacterTableViewCellVm *)characterCellVmWithIndex:(NSInteger)index;
-(ARRK_Character *)characterAtIndex:(NSInteger)index;
@end
