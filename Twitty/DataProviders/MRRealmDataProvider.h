//
//  MRRealmDataProvider.h
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@protocol MRRealmDataProvider <NSObject>
- (RLMResults *)observableResults;
@end
