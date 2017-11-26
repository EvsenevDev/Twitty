//
//  MRScheduler.h
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRBlockTypes.h"

@interface MRScheduler : NSObject
- (void)createTaskInterval:(NSInteger)seconds action:(VoidBlock)action remainsBlock:(RemainsBlock)remainsBlock;
- (void)createTaskInterval:(NSInteger)seconds action:(VoidBlock)action;
- (void)callAction;
- (void)reset;
@end
