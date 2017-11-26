//
//  MRSettingsManager.m
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import "MRSettingsManager.h"
#import "MRLocalSettings.h"

@implementation MRSettingsManager

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        _localSettings = [MRLocalSettings new];
    }
    return self;
}

@end
