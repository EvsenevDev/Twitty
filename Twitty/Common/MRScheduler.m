//
//  MRScheduler.m
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import "MRScheduler.h"

static const NSTimeInterval kTimerTick = 1.0f;

@interface MRScheduler()
@property (nonatomic) NSTimer *timer;
@property (nonatomic) NSInteger seconds;
@property (nonatomic) NSInteger remainSeconds;
@property (nonatomic) VoidBlock action;
@property (nonatomic) RemainsBlock remainsBlock;
@end

@implementation MRScheduler

- (void)createTaskInterval:(NSInteger)seconds action:(VoidBlock)action {
    [self createTaskInterval:seconds action:action remainsBlock:nil];
}

- (void)createTaskInterval:(NSInteger)seconds action:(VoidBlock)action remainsBlock:(RemainsBlock)remainsBlock {
    self.action = action;
    self.remainsBlock = remainsBlock;
    self.seconds = seconds;
    self.remainSeconds = seconds;
    [self updateRemains];
    
    __weak typeof(self) wSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kTimerTick repeats:YES block:^(NSTimer * _Nonnull timer) {
        [wSelf timerTick];
    }];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)timerTick {
    if (self.remainSeconds > 0) {
        self.remainSeconds--;
        [self updateRemains];
    } else {
        [self reset];
        [self callAction];
    }
}

- (void)callAction {
    if (self.action) {
        self.action();
    }
}

- (void)reset {
    self.remainSeconds = self.seconds;
    [self updateRemains];
}

# pragma mark - Private

- (void)updateRemains {
    if (self.remainsBlock) {
        self.remainsBlock(self.remainSeconds);
    }
}

#pragma mark - NSObject

- (void)dealloc {
    [self.timer invalidate];
}

@end
