//
//  Header.h
//  ARRK_SampleProject
//
//  Created by Kogila on 16/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARRK_Constants.h"

@protocol ARRK_WebServiceProtocol <NSObject>

-(void)retrieveListOfCharacters:(fetchCharactersCompletion)completionHandler;
-(void)retrieveCharacterDetailForCharacterID:(NSString *)characterID withCompletionHandler:(fetchCharactersCompletion)completionHandler;
-(void)loadImageFromUrl:(NSURL *)thumbnailUrl withCompletionHandler:(fetchImageDataCompletion)completionHandler;
@end

