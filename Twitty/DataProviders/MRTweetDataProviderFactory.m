//
//  MRTweetDataProviderFactory.m
//  Twitty
//
//  Created by Bogdan Evsenev on 26/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import "MRTweetDataProviderFactory.h"
#import "MRTweetDataProvider.h"
#import "MRTweetAPI.h"
#import "MRTweetParser.h"

@implementation MRTweetDataProviderFactory

#pragma mark - MRPostDataProviderFactory

- (id<MRPostDataProvider, MRRealmDataProvider>)makePostDataProviderWithCache {
    id parser = [MRTweetParser new];
    id api = [[MRTweetAPI alloc] initWithParser:parser];
    id dataProvider = [[MRTweetDataProvider alloc] initWithAPI:api];
    return dataProvider;
}

@end
