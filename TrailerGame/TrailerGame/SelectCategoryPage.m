//
//  SelectCategoryPage.m
//  TrailerGame
//
//  Created by Woo Hyun Jin on 11/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SelectCategoryPage.h"

@interface SelectCategoryPage ()

@property (weak, nonatomic) IBOutlet UITableView *categoryTable;
- (IBAction)buttonRandomClicked:(id)sender;

@end

@implementation SelectCategoryPage
@synthesize categoryTable;

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
    [self setCategoryTable:nil];
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
    UIViewController *playTrailerPage = [[PlayTrailerPage alloc] initWithNibName:@"PlayTrailerPage" bundle:nil];
    [[self navigationController] pushViewController:playTrailerPage animated:YES];
}

- (IBAction)buttonRandomClicked:(id)sender 
{
    [self continueToNextView:sender];
}

@end
