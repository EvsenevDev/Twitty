//
//  MRPostsViewController.m
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import "MRPostsViewController.h"
#import "MRPostDisplayManager.h"
#import "MRPostDataProvider.h"
#import "MRRealmDataProvider.h"
#import "MRScheduler.h"
#import "MRTweetDataProviderFactory.h"

static const NSTimeInterval kUpdateInterval = 60;
static const NSInteger kOldUpdateCellOffset = 5;

@interface MRPostsViewController ()
@property (nonatomic) id<MRDisplayManager> displayManger;
@property (nonatomic) id<MRPostDataProvider, MRRealmDataProvider> dataProvider;
@property (nonatomic) id <MRPostDataProviderFactory> factory;
@property (nonatomic) MRScheduler *scheduler;
@end

@implementation MRPostsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.factory = [MRTweetDataProviderFactory new];
    self.dataProvider = [self.factory makePostDataProviderWithCache];
    [self.dataProvider setSeacrhText:@"Hello"];
    
    RLMResults *results = [self.dataProvider observableResults];
    UITableView *table = self.tableView;
    self.displayManger = [[MRPostDisplayManager alloc] initWithTableView:table observableResults:results];
   
    self.scheduler = [MRScheduler new];
    [self configureScheduler];
    [self updateNew];
}

#pragma mark - Custom Accessors

- (void)setDisplayManger:(id<MRDisplayManager>)displayManger {
    _displayManger = displayManger;
    self.tableView.dataSource = displayManger;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [self.displayManger itemsCount] - kOldUpdateCellOffset) {
        [self updateOld];
    }
}

#pragma mark - Actions

- (IBAction)forceUpdate:(id)sender {
    [self.scheduler callAction];
    [self.scheduler reset];
}

#pragma mark - Private

- (void)configureScheduler {
    __weak typeof(self) wSelf = self;
    [self.scheduler createTaskInterval:kUpdateInterval action:^{
        [wSelf updateNew];
    } remainsBlock:^(NSInteger seconds) {
        NSString *title = [NSString stringWithFormat:@"Update: %lu", seconds];
        wSelf.navigationItem.rightBarButtonItem.title = title;
    }];
}

- (void)updateNew {
    id firstObject = [self.displayManger firstObject];
    if (firstObject && [firstObject conformsToProtocol:@protocol(MRPost)]) {
        [self.dataProvider fetchNewPostsFrom:firstObject];
    } else {
        [self.dataProvider fetchPosts];
    }
}

- (void)updateOld {
    id lastObject = [self.displayManger lastObject];
    if (lastObject && [lastObject conformsToProtocol:@protocol(MRPost)]) {
        [self.dataProvider fetchOldPostsFrom:lastObject];
    }
}

@end
