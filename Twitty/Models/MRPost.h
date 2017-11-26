//
//  MRPost.h
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MRPost <NSObject>
@property (readonly, nonatomic) NSString *postID;
@property (readonly, nonatomic) NSString *postUserName;
@property (readonly, nonatomic) NSString *postText;
@property (readonly, nonatomic) NSURL *photoUrl;
@end
