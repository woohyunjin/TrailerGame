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
@property (nonatomic, retain) NSString *baseMovieListURL;
@property (nonatomic, retain) NSString *baseMovieAccessURL;
@property (nonatomic) int index;
@property (nonatomic) NSTimeInterval interval;
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (nonatomic, retain) UIImage *green;
@property (nonatomic, retain) UIImage *red;

- (IBAction)buttonOneClicked:(id)sender;
- (IBAction)buttonTwoClicked:(id)sender;
- (IBAction)buttonThreeClicked:(id)sender;
- (IBAction)buttonFourClicked:(id)sender;

- (void)loadFromURL:(NSString *)url;
- (void)parseList;
- (void)loadTrailer;
- (void)reactToClick:(id)sender;

@end

@implementation PlayTrailerPage

@synthesize buttonOne;
@synthesize buttonTwo;
@synthesize buttonThree;
@synthesize buttonFour;

@synthesize webView;
@synthesize trailerList;
@synthesize movieList;
@synthesize baseMovieListURL;
@synthesize baseMovieAccessURL;
@synthesize index;
@synthesize interval;

@synthesize green;
@synthesize red;

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

    baseMovieListURL = @"http://www.boomcode.com/getMovielist.php?password=movieAccess"; 
    baseMovieAccessURL = @"http://www.boomcode.com/moviePage.php?movieid=";
    movieList = [NSMutableArray new];
    index = 0;
    interval = 1;
    
    green = [UIImage imageNamed:@"Green.jpg"];
    red = [UIImage imageNamed:@"Red.png"];
    
    [self loadFromURL:baseMovieListURL];
    [self parseList];
    [self loadTrailer];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setButtonOne:nil];
    [self setButtonTwo:nil];
    [self setButtonThree:nil];
    [self setButtonFour:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonOneClicked:(id)sender 
{
    [self reactToClick:sender];
}

- (IBAction)buttonTwoClicked:(id)sender 
{
    [self reactToClick:sender];
}

- (IBAction)buttonThreeClicked:(id)sender 
{
    [self reactToClick:sender];    
}

- (IBAction)buttonFourClicked:(id)sender 
{
    [self reactToClick:sender];
}

- (void)reactToClick:(id)sender
{
    Movie *movie = [movieList objectAtIndex:index];
    UIButton *button = sender;
    bool correct = FALSE;
    
    if ([button.currentTitle isEqualToString:movie.movieName])
    {
        correct = TRUE;
        [button setBackgroundImage:green forState:UIControlStateNormal];
    }
    else 
    {
        correct = FALSE;
        [button setBackgroundImage:red forState:UIControlStateNormal];
    }
    //this does not work. TODO: need to find a way to display the button color change for about a second
    [button setNeedsDisplay];
    [NSThread sleepForTimeInterval:interval];
    
    //this instantiates a points object and adds it to the Points class statis array
    Points *point = [Points new];
    NSTimeInterval timeSpent = 0;
    int pointEarned = 0;
    if (correct) pointEarned = 100;
    [point initValues:movie.movieName name:@"" time:timeSpent points:pointEarned mId:movie.movieId];
    [Points AddGamePoints:point];
    
    index++;        
    [self loadTrailer];
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

- (void)parseList
{   
    NSString *delimiter = @"|";
    for (NSString *line in trailerList)
    {
        NSArray *terms = [line componentsSeparatedByString:delimiter];
        Movie *movie = [Movie new];
        //error checking
        if ([terms count] != 6) //make this constant later
        {
            break;
        }
        int movieId = [[terms objectAtIndex:0] intValue];        
        //for now, choiceOne is the correct answer. this should be randomized later. 
        [movie initValues:movieId name:[terms objectAtIndex:1] url:[terms objectAtIndex:2] one:[terms objectAtIndex:1] two:[terms objectAtIndex:3] three:[terms objectAtIndex:4] four:[terms objectAtIndex:5]];
        [movieList addObject:movie];
    }
}

- (void)loadTrailer
{
    if (index >= movieList.count)
    {
        //In this case, the control should move on to the points summary page
    } else {
        Movie *movie = [movieList objectAtIndex:index];
        
        //initialize the UIWebView to play the right trailer
        NSString *movieId = [NSString stringWithFormat:@"%d", movie.movieId];
        NSString *trailerAddr = [baseMovieAccessURL stringByAppendingString:movieId];
        NSURL *trailerURL = [NSURL URLWithString:trailerAddr];
        NSURLRequest *trailerRequest = [NSURLRequest requestWithURL:trailerURL];
        [webView loadRequest:trailerRequest];
        
        //configure the buttons for the multiple choice
        [buttonOne setTitle:movie.choiceOne forState:UIControlStateNormal];
        [buttonTwo setTitle:movie.choiceTwo forState:UIControlStateNormal];
        [buttonThree setTitle:movie.choiceThree forState:UIControlStateNormal];
        [buttonFour setTitle:movie.choiceFour forState:UIControlStateNormal];       
        
        [buttonOne setBackgroundImage:nil forState:UIControlStateNormal];
        [buttonTwo setBackgroundImage:nil forState:UIControlStateNormal];
        [buttonThree setBackgroundImage:nil forState:UIControlStateNormal];
    }
}

@end
