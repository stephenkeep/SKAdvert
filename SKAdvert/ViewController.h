//
//  ViewController.h
//  SKAdvert
//
//  Created by Stephen Keep on 30/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKAdvertViewController.h"

@interface ViewController : UIViewController {
    SKAdvertViewController *adView;
}

@property (nonatomic, strong) SKAdvertViewController *adView;

@end
