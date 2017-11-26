//
//  MRPostCellTableViewCell.m
//  Twitty
//
//  Created by Bogdan Evsenev on 24/11/2017.
//  Copyright © 2017 BED. All rights reserved.
//

#import "MRPostCellTableViewCell.h"
#import "MRPost.h"
#import "MRSettingsManager.h"
#import "UIImageView+AFNetworking.h"

@interface MRPostCellTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *userPhotoView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postTextLabel;
@end

@implementation MRPostCellTableViewCell

#pragma mark - Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    self.userPhotoView.layer.masksToBounds = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat cornerRadius = CGRectGetWidth(self.userPhotoView.bounds)/2.0f;
    self.userPhotoView.layer.cornerRadius = cornerRadius;
}

#pragma mark - MRConfigurableCell

- (void)configureFromModel:(id<MRPost>)object {
    if (![object conformsToProtocol:@protocol(MRPost)]) {
        return;
    }
    
    self.userNameLabel.text = object.postUserName;
    self.postTextLabel.text = object.postText;
    self.userPhotoView.image = nil;
    
    if (MRSettingsManager.sharedInstance.localSettings.isPhotoEnabled) {
        [self.userPhotoView setImageWithURL:object.photoUrl];
    }
}

@end
