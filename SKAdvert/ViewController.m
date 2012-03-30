//
//  ViewController.m
//  SKAdvert
//
//  Created by Stephen Keep on 30/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize adView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.adView = [[SKAdvertViewController alloc] initWithOrigin:CGPointMake(0, self.view.frame.size.height)];
    [self.view addSubview:adView.view];

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
