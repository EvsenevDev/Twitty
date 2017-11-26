//
//  MRPostParser.h
//  Twitty
//
//  Created by Bogdan Evsenev on 25/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRPost.h"

@protocol MRPostParser <NSObject>
- (id<MRPost>)parsePostJSON:(NSDictionary *)json;
- (NSArray<id<MRPost>> *)parseJSONArray:(NSArray *)jsonArray;
@end
