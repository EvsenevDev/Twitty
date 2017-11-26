//
//  MRSettingsManager.h
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRSettings.h"

@interface MRSettingsManager : NSObject
@property (readonly, nonatomic) id<MRSettings> localSettings;
+ (instancetype)sharedInstance;
@end
