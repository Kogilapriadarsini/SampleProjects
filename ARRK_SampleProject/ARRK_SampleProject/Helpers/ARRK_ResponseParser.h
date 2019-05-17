//
//  ARRK_ResponseParser.h
//  ARRK_SampleProject
//
//  Created by Kogila on 17/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ARRK_Character;
@interface ARRK_ResponseParser : NSString
+(NSArray<ARRK_Character * >*)listOfCharactersFromDictionary:(NSDictionary *)dataDictionary;
@end
