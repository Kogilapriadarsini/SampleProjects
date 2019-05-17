//
//  ARRK_WebService.m
//  ARRK_SampleProject
//
//  Created by Kogila on 15/05/19.
//  Copyright © 2019 com.jiocloud.jioswitch. All rights reserved.
//

#import "ARRK_WebService.h"
#import "ARRK_CreateRequestHelper.h"
#import "ARRK_WebServiceProtocol.h"
@interface ARRK_WebService() <NSURLSessionDelegate,NSURLSessionTaskDelegate,NSURLSessionDataDelegate>
@property (nonatomic,strong) NSURLSession *arrk_Session;
@end

static ARRK_WebService *webserviceSingleton = nil;

@implementation ARRK_WebService
+(ARRK_WebService *)sharedInstance
{
    if(webserviceSingleton == nil)
    {
        webserviceSingleton = [[ARRK_WebService alloc] initWithSessionConfiguration];
    }
    return webserviceSingleton;
}
-(id)initWithSessionConfiguration
{
    self = [self init];
    if (self)
    {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.HTTPMaximumConnectionsPerHost = 1;
        configuration.HTTPAdditionalHeaders = @{
                                                @"Accept-Language" : @"en",
                                            };
        
        self.arrk_Session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    }
    return self;
}
/**
 * This method will be caled when we have to fetch list of charatcers from server.
 * @author Kogila
 *
 * @param completionHandler object.
 */
-(void)retrieveListOfCharacters:(fetchCharactersCompletion)completionHandler
{
    NSMutableURLRequest * req = [ARRK_CreateRequestHelper createRequestForFetchingAllCharacters];
  NSURLSessionDataTask *dataTask =  [self.arrk_Session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

      NSDictionary *fileDictionary  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        completionHandler(error, fileDictionary);
    }];
    [dataTask resume];
}
//Not used
-(void)retrieveCharacterDetailForCharacterID:(NSString *)characterID withCompletionHandler:(fetchCharactersCompletion)completionHandler
{
    NSMutableURLRequest * req = [ARRK_CreateRequestHelper createRequestForFetchingCharacterDetail];
    NSURLSessionDataTask *dataTask = [self.arrk_Session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *fileDictionary  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        completionHandler(error, fileDictionary);
    }];
    [dataTask resume];
}
/**
 * This method will download image data from server.
 * @author Kogila
 *
 * @param thumbnailUrl and completionHandler.
 */
-(void)loadImageFromUrl:(NSURL *)thumbnailUrl withCompletionHandler:(fetchImageDataCompletion)completionHandler
{
    NSMutableURLRequest * req = [ARRK_CreateRequestHelper createRequestForFetchingImageDataForUrl:thumbnailUrl];
    NSURLSessionDataTask *dataTask = [self.arrk_Session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completionHandler(error, data);
    }];
    [dataTask resume];
}
#pragma mark - URLSession delegates
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    
}
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    
}
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
    
}
- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error
{
    
}
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
{
    if (completionHandler) {
        completionHandler(NSURLSessionAuthChallengePerformDefaultHandling, nil);
    }
}
@end
