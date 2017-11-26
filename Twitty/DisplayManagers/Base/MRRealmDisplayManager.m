//
//  MRRealmDisplayManager.m
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Realm/Realm.h>
#import "MRRealmDisplayManager.h"
#import "MRConfigurableCell.h"

@interface MRRealmDisplayManager()
@property (weak, nonatomic) UITableView *tableView;
@property (nonatomic) RLMResults *observableResults;
@property (nonatomic) RLMNotificationToken *notificationToken;
@end

@implementation MRRealmDisplayManager

- (instancetype)initWithTableView:(UITableView *)tableView observableResults:(RLMResults *)results {
    if (self = [super init]) {
        _tableView = tableView;
        _observableResults = results;
        [self configureForChanges];
    }
    return self;
}

-  (void)configureForChanges {
    __weak typeof(self) wSelf = self;
    id notificationBlock = ^(RLMResults *results, RLMCollectionChange *change, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        UITableView *tableView = wSelf.tableView;
        [tableView reloadData];
    };
    self.notificationToken = [self.observableResults addNotificationBlock:notificationBlock];
}

- (void)dealloc {
    [self.notificationToken invalidate];
}

#pragma mark - MRDisplayManager

- (NSString *)cellIdentifier {
    return nil;
}

- (NSInteger)itemsCount {
    return self.observableResults.count;
}

- (id)firstObject {
    return self.observableResults.firstObject;
}

- (id)lastObject {
    return self.observableResults.lastObject;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.observableResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifier]];
    if ([cell conformsToProtocol:@protocol(MRConfigurableCell)]) {
        UITableViewCell<MRConfigurableCell> *configurableCell = (id)cell;
        [configurableCell configureFromModel:[self.observableResults objectAtIndex:indexPath.row]];
        return configurableCell;
    }
    NSLog(@"ERROR: Cell is not configured");
    return cell;
}

@end
