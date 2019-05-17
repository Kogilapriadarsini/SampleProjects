//
//  ARRK_CreateRequestHelper.m
//  ARRK_SampleProject
//
//  Created by Kogila on 16/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import "ARRK_CreateRequestHelper.h"
#import "ARRK_ApiEndPointManager.h"
#import "NSString+Extension.h"

@implementation ARRK_CreateRequestHelper

+(NSMutableURLRequest *)createRequestForFetchingAllCharacters
{
    NSURL *url = [NSURL URLWithString:[ARRK_ApiEndPointManager endPointUrlStringForEndPoint:ArrkApiEndpointAllCharacters]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    return request;
}
+(NSMutableURLRequest *)createRequestForFetchingCharacterDetail
{
    NSURL *url = [NSURL URLWithString:[ARRK_ApiEndPointManager endPointUrlStringForEndPoint:ArrkApiEndpointCharacterDetail]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    return request;
}
+(NSMutableURLRequest *)createRequestForFetchingImageDataForUrl:(NSURL *)imageURL
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:imageURL];
    [request setHTTPMethod:@"GET"];
    return request;
}
@end
