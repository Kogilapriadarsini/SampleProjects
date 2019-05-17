//
//  ARRK_ResponseParser.m
//  ARRK_SampleProject
//
//  Created by Kogila on 17/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import "ARRK_ResponseParser.h"
#import "ARRK_Character.h"

@implementation ARRK_ResponseParser
/**
 * This method will be caled when we get response from webservice, to parse the data.
 * @author Kogila
 *
 * @param dataDictionary object.
 * @return Array of ARRK_Character objects.
 */
+(NSArray<ARRK_Character *>*)listOfCharactersFromDictionary:(NSDictionary *)dataDictionary
{
    NSMutableArray *charactersArray = [NSMutableArray array];
    NSDictionary *dataDict = [dataDictionary objectForKey:@"data"];
    NSArray *resultArray = [dataDict objectForKey:@"results"];
    for (NSDictionary *dict in resultArray)
    {
        ARRK_Character *character = [[ARRK_Character alloc] init];
        character.uniqueId = [[dict objectForKey:@"id"] integerValue];
        character.name = [dict objectForKey:@"name"];
        character.thumbnailUrl = [[dict objectForKey:@"thumbnail"] objectForKey:@"path"];
        character.pathExtension = [[dict objectForKey:@"thumbnail"] objectForKey:@"extension"];
        character.biography = [dict objectForKey:@"description"];
        NSMutableArray *comicsList = [NSMutableArray array];
        NSArray *comicsDictionary = [[dict objectForKey:@"comics"] objectForKey:@"items"];
        for (NSDictionary *comicDict in comicsDictionary)
        {
            [comicsList addObject:[comicDict objectForKey:@"name"]];
        }
        character.listOfComics = [comicsList copy];
        [charactersArray addObject:character];
        
    }
    return [charactersArray copy];
}
@end
