//
//  MRTweetPost.m
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import "MRPostObject.h"

static NSString *const kPostObjectPrimaryKey = @"uniqueId";

@implementation MRPostObject

#pragma mark - MRPost

- (NSString *)postID {
    return [self.identifier stringValue];
}

- (NSString *)postUserName {
    return self.name;
}

- (NSString *)postText {
    return self.text;
}

- (NSURL *)photoUrl {
    return [NSURL URLWithString:self.userPhotoUrl];
}

#pragma mark - Realm

+ (NSString *)primaryKey {
    return kPostObjectPrimaryKey;
}

@end
