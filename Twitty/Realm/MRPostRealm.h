//
//  MRPostRealm.h
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MRPostObject;

@interface MRPostRealm : NSObject
- (void)savePosts:(NSArray<MRPostObject *> *)posts;
- (RLMResults *)allObjectsResults;
- (RLMResults *)dateSortedObjectsResults;
@end
