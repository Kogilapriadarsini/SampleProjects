//
//  ARRK_CreateRequestHelper.h
//  ARRK_SampleProject
//
//  Created by Kogila on 16/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ARRK_CreateRequestHelper : NSObject


+(NSMutableURLRequest *)createRequestForFetchingAllCharacters;
+(NSMutableURLRequest *)createRequestForFetchingCharacterDetail;
+(NSMutableURLRequest *)createRequestForFetchingImageDataForUrl:(NSURL *)imageURL;
@end
