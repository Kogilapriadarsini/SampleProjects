//
//  ARRK_ApiEndPointManager.m
//  ARRK_SampleProject
//
//  Created by Kogila on 16/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import "ARRK_ApiEndPointManager.h"
#import "NSString+Extension.h"
#define ALL_CHARACTERS @"/v1/public/characters"
#define CHARACTERS_DETAILS @"/v1/public/characters/"
#define PUBLIC_KEY  @"0d089878b9bdd60fce439682bec6418e"
#define PRIVATE_KEY @"3d42e61108170710acc4024e28c6ea0196c17286"
@implementation ARRK_ApiEndPointManager

+(NSString *)endPointUrlStringForEndPoint:(ArrkApiEndpoint )apiEndPoint
{
    switch (apiEndPoint) {
        case ArrkApiEndpointAllCharacters:
        {
           NSDateFormatter *formtr = [[NSDateFormatter alloc]init];
            [formtr setDateFormat:@"mmm ss"];
            NSString *dateStr = [formtr stringFromDate:[NSDate date]];
            dateStr = [dateStr stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSString *str =  [NSString stringWithFormat:@"%@%@%@",dateStr,PRIVATE_KEY,PUBLIC_KEY];
            
            NSString *finalStr = [NSString stringWithFormat:@"%@%@?ts=%@&apikey=%@&hash=%@",API_BASE_END_POINT,ALL_CHARACTERS,dateStr,PUBLIC_KEY,[str MD5String]];
            
            return finalStr;
            break;
    }
            //Its not used.
        case ArrkApiEndpointCharacterDetail:
            return [NSString stringWithFormat:@"%@%@?apikey=%@",API_BASE_END_POINT,CHARACTERS_DETAILS,PUBLIC_KEY];
            
        default:
            return nil;
            break;
    }
}

@end
