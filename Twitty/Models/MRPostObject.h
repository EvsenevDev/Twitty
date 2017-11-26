//
//  MRPostObject.h
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "MRPost.h"

@interface MRPostObject : RLMObject <MRPost>
@property NSNumber<RLMInt> *identifier;
@property NSString *name;
@property NSString *text;
@property NSString *userPhotoUrl;
@property NSString *social;
@property NSString *uniqueId;
@end
