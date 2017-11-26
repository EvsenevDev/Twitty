//
//  MRTweetParser.m
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import "MRTweetParser.h"
#import "MRPostObject.h"

static NSString *const kIdKey = @"id";
static NSString *const kUserKey = @"user";
static NSString *const kNameKey = @"name";
static NSString *const kTextKey = @"text";
static NSString *const kPhotoKey = @"profile_image_url_https";
static NSString *const kTwitterSocial = @"twitter";

@implementation MRTweetParser

- (id<MRPost>)parsePostJSON:(NSDictionary *)json {
    MRPostObject *post = [MRPostObject new];
    post.identifier = json[kIdKey];
    post.name = json[kUserKey][kNameKey];
    post.text = json[kTextKey];
    post.userPhotoUrl = json[kUserKey][kPhotoKey];
    post.social = kTwitterSocial;
    post.uniqueId = [NSString stringWithFormat:@"%@_%@", post.social, post.identifier];
    return post;
}

- (NSArray<id<MRPost>> *)parseJSONArray:(NSArray *)jsonArray {
    NSMutableArray *result = [NSMutableArray new];
    for (id json in jsonArray) {
        id<MRPost> post = [self parsePostJSON:json];
        [result addObject:post];
    }
    return result;
}

@end
