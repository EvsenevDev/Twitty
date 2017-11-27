//
//  MRPostDataProvider.h
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRPost.h"
#import "MRPostAPI.h"

@protocol MRPostDataProvider <NSObject>
- (instancetype)initWithAPI:(id<MRPostAPI>)api;
- (void)setSearchText:(NSString *)text;
- (void)fetchPosts;
- (void)fetchNewPostsFrom:(id<MRPost>)post;
- (void)fetchOldPostsFrom:(id<MRPost>)post;
@end
