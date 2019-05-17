//
//  ARRK_Constants.h
//  ARRK_SampleProject
//
//  Created by Kogila on 15/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

typedef enum {
    ArrkApiEndpointAllCharacters = 1,
    ArrkApiEndpointCharacterDetail,
}ArrkApiEndpoint;

#import <Foundation/Foundation.h>

typedef void(^fetchCharactersCompletion)(NSError *error, NSDictionary *data);
typedef void(^fetchImageDataCompletion) (NSError *error, NSData *imageData);
extern NSString * const API_BASE_END_POINT;

@interface ARRK_Constants : NSObject

@end
