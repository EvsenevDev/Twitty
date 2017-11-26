//
//  MRBlockTypes.h
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - API Callbacks

typedef void(^SuccessCallback)(void);
typedef void(^SuccessCallbackWithObjects)(NSArray *);
typedef void(^ErrorCallback)(NSError *);
typedef void(^NetworkCallback)(NSURLResponse *, id, NSError *);

#pragma mark - Common Blocks

typedef void(^VoidBlock)(void);
typedef void(^RemainsBlock)(NSInteger);
