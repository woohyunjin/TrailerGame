//
//  LogOnPage.m
//  TrailerGame
//
//  Created by Woo Hyun Jin on 11/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LogOnPage.h"

@interface LogOnPage ()
- (IBAction)buttonLoginClicked:(id)sender;

@end

@implementation LogOnPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)continueToNextView:(id)sender
{
    UIViewController *playPage = [[PlayPage alloc] initWithNibName:@"PlayPage" bundle:nil];
    [[self navigationController] pushViewController:playPage animated:YES];
}

- (IBAction)buttonLoginClicked:(id)sender {
    [self continueToNextView:sender];
}

@end
