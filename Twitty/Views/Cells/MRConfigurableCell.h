//
//  MRConfigurableCell.h
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MRConfigurableCell <NSObject>
- (void)configureFromModel:(id)object;
@end
