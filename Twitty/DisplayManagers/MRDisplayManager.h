//
//  MRDisplayManager.h
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MRDisplayManager <NSObject, UITableViewDataSource>
- (NSString *)cellIdentifier;
- (NSInteger)itemsCount;
- (id)firstObject;
- (id)lastObject;
@end
