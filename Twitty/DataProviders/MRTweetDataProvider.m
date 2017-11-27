//
//  MRTweetDataProvider.m
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import "MRTweetDataProvider.h"
#import "MRTweetAPI.h"
#import "MRTweetParser.h"
#import "MRPostObject.h"
#import "MRPostRealm.h"

@interface MRTweetDataProvider()
@property (nonatomic) id<MRPostAPI> postAPI;
@property (nonatomic) MRPostRealm *realm;
@end

@implementation MRTweetDataProvider

#pragma mark - MRPostDataProvider

- (instancetype)initWithAPI:(id<MRPostAPI>)api {
    if (self = [super init]) {
        _postAPI = api;
        _realm = [MRPostRealm new];
    }
    return self;
}

- (void)setSearchText:(NSString *)text {
    [self.postAPI setSearchText:text];
}

- (void)fetchPosts {
    [self.postAPI getPosts:[self successCallback] errorHandler:[self errorCallback]];
}

- (void)fetchNewPostsFrom:(id<MRPost>)post {
    SuccessCallbackWithObjects successHandler = [self successCallback];
    ErrorCallback errorHandler = [self errorCallback];
    [self.postAPI getPostsNewPostsFrom:post withSuccess:successHandler errorHandler:errorHandler];
}

- (void)fetchOldPostsFrom:(id<MRPost>)post {
    SuccessCallbackWithObjects successHandler = [self successCallback];
    ErrorCallback errorHandler = [self errorCallback];
    [self.postAPI getPostsOldPostsFrom:post withSuccess:successHandler errorHandler:errorHandler];
}

#pragma mark - MRRealmDataProvider

- (RLMResults *)observableResults {
    return [self.realm dateSortedObjectsResults];
}

#pragma mark - Private

- (SuccessCallbackWithObjects)successCallback {
    __weak typeof(self) wSelf = self;
    return ^(NSArray *objects) {
        [wSelf.realm savePosts:objects];
    };
}

- (ErrorCallback)errorCallback {
    return ^(NSError *error) {
        NSLog(@"ERROR: %@", error.localizedDescription);
    };
}

@end
