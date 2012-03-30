//
//  SKAdvertViewController.m
//  SKAdvertisement
//
//  Created by Stephen Keep on 30/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SKAdvertViewController.h"
#import "SVWebViewController.h"

//Decalare Advert Sizes
CGSize iPhonePortraitSize = {320, 50};
CGSize iPhoneLandscape = {480, 32};
CGSize iPadPortraitSize = {768, 66};
CGSize iPadLandscapeSize = {1024, 66};

static NSString *contentSizeIdentifierForCurrentInterface() {
	UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
	UIUserInterfaceIdiom idiom = [[UIDevice currentDevice] userInterfaceIdiom];
	
	if (UIInterfaceOrientationIsPortrait(orientation)) {
		if (idiom == UIUserInterfaceIdiomPhone)
			return SKAdvertPortrait;
		else if (idiom == UIUserInterfaceIdiomPad)
			return  SKAdvertiPadPortrait;
	} else if (UIInterfaceOrientationIsLandscape(orientation)) {
		if (idiom == UIUserInterfaceIdiomPhone)
			return  SKAdvertLandscape;
		else if (idiom == UIUserInterfaceIdiomPad)
			return  SKAdvertiPadLandscape;
	}
	return nil;
}


@interface SKAdvertViewController ()

@end

@implementation SKAdvertViewController

@synthesize requiredContentSizeIdentifiers, currentContentSizeIdentifier, adButton;

#pragma mark - 
#pragma mark - init methods

- (id) initWithOrigin:(CGPoint)point {
	self = [super init];
	if (self) {
        
        self.view.backgroundColor = [UIColor clearColor];
        
		currentContentSizeIdentifier = contentSizeIdentifierForCurrentInterface();
		CGSize viewSize = [self sizeFromBannerContentSizeIdentifier:currentContentSizeIdentifier];
		self.view.frame = CGRectMake(point.x, point.y-viewSize.height, viewSize.width, viewSize.height);
        
		UIButton *button = [[UIButton alloc] initWithFrame:(CGRect) {CGPointZero, viewSize}];
		self.adButton = button;
		[self.adButton addTarget:self action:@selector(adTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"advert.png"];		
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:bundlePath];   
        [self.adButton setImage:image forState:UIControlStateNormal];
        [image release];
		[self.view addSubview:adButton];
	}
	return self;
}


#pragma mark - 
#pragma mark - Get Ad Size

+ (CGSize) sizeFromBannerContentSizeIdentifier:(NSString *)contentSizeIdentifier {
	if (contentSizeIdentifier == SKAdvertLandscape) {
		return iPhoneLandscape;
	} else if (contentSizeIdentifier == SKAdvertPortrait) {
		return iPhonePortraitSize;
	} else if (contentSizeIdentifier == SKAdvertiPadLandscape) {
		return iPadLandscapeSize;
	} else if (contentSizeIdentifier == SKAdvertiPadPortrait) {
		return iPadPortraitSize;
	} else
		return CGSizeZero;
}

- (CGSize) sizeFromBannerContentSizeIdentifier:(NSString *)contentSizeIdentifier {
	return [SKAdvertViewController sizeFromBannerContentSizeIdentifier:contentSizeIdentifier];
}

#pragma mark - 
#pragma mark - Ad Button Pressed

-(void)adTapped:(id)sender {
    //present webview from the root view controller
    SVWebViewController *vc = [[SVWebViewController alloc] initWithAddress:REQUEST_URL];
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentModalViewController:vc animated:YES]; 
    [vc release];
}

@end
