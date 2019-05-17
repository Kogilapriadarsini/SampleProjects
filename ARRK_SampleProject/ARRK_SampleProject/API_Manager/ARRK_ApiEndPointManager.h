//
//  ARRK_ApiEndPointManager.h
//  ARRK_SampleProject
//
//  Created by Kogila on 16/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARRK_Constants.h"
@interface ARRK_ApiEndPointManager : NSObject
+(NSString *)endPointUrlStringForEndPoint:(ArrkApiEndpoint )apiEndPoint;
@end

