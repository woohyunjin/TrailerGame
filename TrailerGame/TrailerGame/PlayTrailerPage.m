//
//  PlayTrailerPage.m
//  TrailerGame
//
//  Created by Woo Hyun Jin on 11/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayTrailerPage.h"

@interface PlayTrailerPage ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSArray *trailerList;
- (void)loadFromURL:(NSString *)url;
- (void)loadTrailer;

@end

@implementation PlayTrailerPage
@synthesize webView;
@synthesize trailerList;

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
    
    [self loadFromURL:@"http://www.boomcode.com/getMovielist.php?password=movieAccess"];
    [self loadTrailer];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)loadFromURL:(NSString *)url 
{
    NSURL *urlRequest = [NSURL URLWithString:url];
    //this is more easier way of doing it: TODO: ask Han to implement the data page like http://icodeblog.com/samples/nsoperation/data.plist 
    //trailerList = [NSArray arrayWithContentsOfURL:urlRequest]; 
    NSError *err = nil;
    NSString *content = [NSString stringWithContentsOfURL:urlRequest encoding:NSUTF8StringEncoding error:&err];

    if (err)
    {
        //handle errors here
    }
    
    // Let's parse the contents of the html
    trailerList = [content componentsSeparatedByString:@"<br />"];
    
}

- (void) loadTrailer
{
    NSString *trailerAddr = @"http://www.boomcode.com/moviePage.php?movieid=1";
    NSURL *trailerURL = [NSURL URLWithString:trailerAddr];
    NSURLRequest *trailerRequest = [NSURLRequest requestWithURL:trailerURL];
    [webView loadRequest:trailerRequest];
}

@end
