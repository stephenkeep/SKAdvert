//
//  SKAdvertViewController.h
//  SKAdvertisement
//
//  Created by Stephen Keep on 30/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const SKAdvertLandscape = @"SKAdvertLandscape";
static NSString *const SKAdvertPortrait = @"SKAdvertPortrait";
static NSString *const SKAdvertiPadLandscape = @"SKAdvertiPadLandscape";
static NSString *const SKAdvertiPadPortrait = @"SKAdvertiPadPortrait";

#define REQUEST_URL @"http://www.quipper.com"

@interface SKAdvertViewController : UIViewController {
    IBOutlet UIButton *adButton;
}

/** The button shown to the user that takes up all the entire view's frame. */
@property (nonatomic, strong) UIButton *adButton;

/** Mimics iAd. See ADBannerView. */
@property (nonatomic, copy) NSSet *requiredContentSizeIdentifiers;
@property (nonatomic, copy) NSString *currentContentSizeIdentifier;

- (id) initWithOrigin:(CGPoint) point;

@end
