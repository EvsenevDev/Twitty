//
//  MRTweetDataProvider.h
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRPostDataProvider.h"
#import "MRRealmDataProvider.h"

@interface MRTweetDataProvider : NSObject <MRPostDataProvider, MRRealmDataProvider>

@end
