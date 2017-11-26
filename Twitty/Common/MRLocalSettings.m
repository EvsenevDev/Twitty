//
//  MRLocalSettings.m
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import "MRLocalSettings.h"

static NSString *const kPhotoEnabledKey = @"settings.photo.enabled";

@implementation MRLocalSettings

- (BOOL)isPhotoEnabled {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:kPhotoEnabledKey]) {
        return [[self defaultValues][kPhotoEnabledKey] boolValue];
    }
    return [[NSUserDefaults standardUserDefaults] boolForKey:kPhotoEnabledKey];
}

- (void)setIsPhotoEnabled:(BOOL)isPhotoEnabled {
    [[NSUserDefaults standardUserDefaults] setBool:isPhotoEnabled forKey:kPhotoEnabledKey];
}

#pragma mark - Default Values
- (NSDictionary *)defaultValues {
    return @{ kPhotoEnabledKey : @YES };
}

@end
