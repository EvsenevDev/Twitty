//
//  MRPostAPI.h
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRBlockTypes.h"

@protocol MRPost;
@protocol MRPostParser;

@protocol MRPostAPI <NSObject>
- (instancetype)initWithParser:(id<MRPostParser>)parser;
- (void)setSearchText:(NSString *)searchText;
- (void)getPosts:(SuccessCallbackWithObjects)successHandler errorHandler:(ErrorCallback)errorHandler;
- (void)getPostsOldPostsFrom:(id<MRPost>)post
                 withSuccess:(SuccessCallbackWithObjects)successHandler
                errorHandler:(ErrorCallback)errorHandler;

- (void)getPostsNewPostsFrom:(id<MRPost>)post
                 withSuccess:(SuccessCallbackWithObjects)successHandler
                errorHandler:(ErrorCallback)errorHandler;
@end
