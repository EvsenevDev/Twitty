//
//  MRTweetAPI.m
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "MRTweetAPI.h"
#import "MRPostParser.h"
#import "MRBlockTypes.h"

static NSString *const kTwitterEndpoint = @"https://api.twitter.com/1.1/search/tweets.json";
static NSString *const kResultArrayKey = @"statuses";
static NSString *const kTwitterAuthHeader = @"Authorization";
static NSString *const kMaxIdKey = @"max_id";
static NSString *const kSinceIdKey = @"since_id";
static NSString *const kTwitterBearer = @"Bearer AAAAAAAAAAAAAAAAAAAAALlo3QAAAAAAEGNgjfnHTCzTaEyEfeWKhCCgRxw%3DAzfrg4AumA4InseizCXoefFKNjuWAXQEFYYbW8W9XHxj6CjikK";

@interface MRTweetAPI()
@property (nonatomic) AFURLSessionManager *requestManager;
@property (nonatomic) id<MRPostParser> parser;
@property (nonatomic) NSString *searchText;
@end

@implementation MRTweetAPI

- (instancetype)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _requestManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    }
    return self;
}

- (instancetype)initWithParser:(id<MRPostParser>)parser {
    if (self = [self init]) {
        _parser = parser;
    }
    return self;
}

#pragma mark - MRPostAPI

- (void)getPosts:(SuccessCallbackWithObjects)successHandler errorHandler:(ErrorCallback)errorHandler {
    [self getPostWithParams:nil successHandler:successHandler errorHandler:errorHandler];
}

- (void)getPostsNewPostsFrom:(id<MRPost>)post withSuccess:(SuccessCallbackWithObjects)successHandler
  errorHandler:(ErrorCallback)errorHandler {
    id params = @{ kSinceIdKey : post.postID };
    [self getPostWithParams:params successHandler:successHandler errorHandler:errorHandler];
}

- (void)getPostsOldPostsFrom:(id<MRPost>)post withSuccess:(SuccessCallbackWithObjects)successHandler
  errorHandler:(ErrorCallback)errorHandler {
    id params = @{ kMaxIdKey : post.postID };
    [self getPostWithParams:params successHandler:successHandler errorHandler:errorHandler];
}

#pragma mark - Private

- (void)getPostWithParams:(NSDictionary *)params successHandler:(SuccessCallbackWithObjects)successHandler
  errorHandler:(ErrorCallback)errorHandler {
    NSMutableDictionary *requestParams = [NSMutableDictionary new];
    [requestParams addEntriesFromDictionary:params];
    [requestParams setObject:self.searchText forKey:@"q"];
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer]
                                    requestWithMethod:@"GET"
                                    URLString:kTwitterEndpoint
                                    parameters:requestParams
                                    error:nil];
    [request setValue:kTwitterBearer forHTTPHeaderField:kTwitterAuthHeader];
    
    __weak typeof(self) wSelf = self;
    NetworkCallback callback = ^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error && errorHandler) {
            errorHandler(error);
        } else {
            if (successHandler) {
                NSArray *posts = [wSelf.parser parseJSONArray:responseObject[kResultArrayKey]];
                successHandler(posts);
            }
        }
    };
    
    [[self.requestManager dataTaskWithRequest:request completionHandler:callback] resume];
}

@end
