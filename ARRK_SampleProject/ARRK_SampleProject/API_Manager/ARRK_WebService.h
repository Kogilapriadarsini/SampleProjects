//
//  ARRK_WebService.h
//  ARRK_SampleProject
//
//  Created by Kogila on 15/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ARRK_WebServiceProtocol;
@interface ARRK_WebService : NSObject<ARRK_WebServiceProtocol>
+(ARRK_WebService *)sharedInstance;
@end

