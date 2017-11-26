//
//  MRRealmDisplayManager.h
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRDisplayManager.h"

@class RLMResults;

@interface MRRealmDisplayManager : NSObject <MRDisplayManager>
- (instancetype)initWithTableView:(UITableView *)tableView observableResults:(RLMResults *)results;
@end
