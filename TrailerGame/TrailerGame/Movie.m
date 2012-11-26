//
//  Movie.m
//  TrailerGame
//
//  Created by Ibrahim Abdul Rahim on 11/11/12.
//
//

#import "Movie.h"
#import "MovieCategory.h"


@implementation Movie

@synthesize movieId;
@synthesize movieName;
@synthesize youtubeURL;
@synthesize choiceOne;
@synthesize choiceTwo;
@synthesize choiceThree;
@synthesize choiceFour;

- (void)initValues:(int)mId name:(NSString *)name url:(NSString *)url one:(NSString *)one 
               two:(NSString *)two three:(NSString *)three four:(NSString *)four
{
    self.movieId = mId;
    self.movieName = name;
    self.youtubeURL = url;
    self.choiceOne = one;
    self.choiceTwo = two;
    self.choiceThree = three;
    self.choiceFour = four;
}

@end
