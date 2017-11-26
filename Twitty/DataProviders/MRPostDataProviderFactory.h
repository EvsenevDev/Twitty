//
//  MRPostDataProviderFactory.h
//  Twitty
//
//  Created by Bogdan Evsenev on 26/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MRPostDataProvider;
@protocol MRRealmDataProvider;

@protocol MRPostDataProviderFactory <NSObject>
- (id<MRPostDataProvider, MRRealmDataProvider>)makePostDataProviderWithCache;
@end
