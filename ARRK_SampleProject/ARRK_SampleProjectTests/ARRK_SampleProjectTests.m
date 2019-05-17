//
//  ARRK_SampleProjectTests.m
//  ARRK_SampleProjectTests
//
//  Created by Kogila on 15/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ARRK_ResponseParser.h"
#import "ARRK_Character.h"
@interface ARRK_SampleProjectTests : XCTestCase

@end

@implementation ARRK_SampleProjectTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testWhetherItParsesDataSuccessfully {
    NSDictionary *responseData = [self loadJsonResponseFromFile:@"testData"];
    NSArray *list =  [ARRK_ResponseParser listOfCharactersFromDictionary:responseData];
    XCTAssert(list.count == 1);
    
    ARRK_Character *character = [list objectAtIndex:0];
    XCTAssert([character.name isEqualToString:@"3-D Man"]);
    XCTAssert([character.biography isEqualToString:@"3d description"]);
    XCTAssert([character.thumbnailUrl isEqualToString:@"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"]);
    XCTAssert([character.pathExtension isEqualToString:@"jpg"]);
    XCTAssert([character.listOfComics count] == 12);
    

}
- (NSDictionary *)loadJsonResponseFromFile:(NSString *)filename
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *fileUrl = [bundle URLForResource:filename withExtension:@"json"];
    NSData* fileData = [NSData dataWithContentsOfURL:fileUrl];
    NSError* parseError = nil;
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:fileData
                                                             options:NSJSONReadingMutableContainers
                                                               error:&parseError];
    return response;
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
