//
//  TrailerGameViewController.m
//  TrailerGame
//
//  Created by Woo Hyun Jin on 11/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrailerGameViewController.h"

@interface TrailerGameViewController ()

@end

@implementation TrailerGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
