//
//  ARRK_CharactersListVm.m
//  ARRK_SampleProject
//
//  Created by Kogila on 16/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import "ARRK_CharactersListVm.h"
#import "ARRK_WebServiceProtocol.h"
#import "ARRK_WebService.h"
#import "ARRK_ResponseParser.h"
@interface ARRK_CharactersListVm()
@property (nonatomic, weak) id<ARRK_CharactersListVmDelegate> delegate;
@property (nonatomic, strong) id<ARRK_WebServiceProtocol> webService;
@property (nonatomic, strong) NSArray *listOfCharacters;
@end

@implementation ARRK_CharactersListVm
-(id)initWithDelegate:(id<ARRK_CharactersListVmDelegate>)delegate
{
    self = [self init];
    if (self) {
        self.delegate  = delegate;
        self.webService = (id<ARRK_WebServiceProtocol>)[ARRK_WebService sharedInstance];
    }
    return self;
}

-(void)fetchCharactersList
{
    [self.webService retrieveListOfCharacters:^(NSError *error, NSDictionary *data) {
        if (error == nil)
        {
           self.listOfCharacters = [ARRK_ResponseParser listOfCharactersFromDictionary:data];
            if ([self.delegate respondsToSelector:@selector(didFinishFetchingCharacters)]) {
                [self.delegate didFinishFetchingCharacters];
            }
        }
        else
        {
            if ([self.delegate respondsToSelector:@selector(didFailFetchingCharacterWithError:)])
            {
                [self.delegate didFailFetchingCharacterWithError:error];
            }
        }
    }];
}
-(NSInteger)dataCount
{
    return [self.listOfCharacters count];
}
/**
 * This method will create cel vm object.
 * @author Kogila
 *
 * @param index
 * @return ARRK_CharacterTableViewCellVm object.
 */
-(ARRK_CharacterTableViewCellVm *)characterCellVmWithIndex:(NSInteger)index
{
    if (self.listOfCharacters.count > index)
    {
        ARRK_CharacterTableViewCellVm *vm = [[ARRK_CharacterTableViewCellVm alloc] initWithCharacterObject:[self.listOfCharacters objectAtIndex:index]];
       
        return vm;
    }
    return nil;
}
/**
 * This method will create cel vm object.
 * @author Kogila
 *
 * @param index
 * @return ARRK_Character object.
 */
-(ARRK_Character *)characterAtIndex:(NSInteger)index
{
    if (self.listOfCharacters.count > index)
    {
        return [self.listOfCharacters objectAtIndex:index];
    }
    return  nil;
}
@end
