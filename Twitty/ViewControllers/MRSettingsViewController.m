//
//  MRSettingsViewController.m
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import <Realm/Realm.h>
#import "MRSettingsViewController.h"
#import "MRSettings.h"
#import "MRSettingsManager.h"

@interface MRSettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *photoSwitch;
@end

@implementation MRSettingsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BOOL isPhotoEnabled = MRSettingsManager.sharedInstance.localSettings.isPhotoEnabled;
    [self.photoSwitch setOn:isPhotoEnabled];
}

#pragma mark - Actions

- (IBAction)photoSwichValueChanged:(UISwitch *)sender {
    MRSettingsManager.sharedInstance.localSettings.isPhotoEnabled = sender.isOn;
}

- (IBAction)clearCache:(UIBarButtonItem *)sender {
    [[RLMRealm defaultRealm] beginWriteTransaction];
    [[RLMRealm defaultRealm] deleteAllObjects];
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

@end
