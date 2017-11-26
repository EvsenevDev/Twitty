//
//  MRPostRealm.m
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Realm/Realm.h>
#import "MRPostRealm.h"
#import "MRPostObject.h"

NSString *const kSortingKey = @"identifier";

@interface MRPostRealm()
@property (nonatomic) RLMRealm *realm;
@end

@implementation MRPostRealm

- (instancetype)init {
    if (self = [super init]) {
        _realm = [RLMRealm defaultRealm];
    }
    return self;
}

- (void)savePosts:(NSArray<MRPostObject *> *)posts {
    [self.realm beginWriteTransaction];
    [self.realm addOrUpdateObjects:posts];
    [self.realm commitWriteTransaction];
}

- (RLMResults *)allObjectsResults {
    return [MRPostObject allObjects];
}

- (RLMResults *)dateSortedObjectsResults {
    return [[MRPostObject allObjects] sortedResultsUsingKeyPath:kSortingKey ascending:NO];
}

@end
