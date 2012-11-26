//
//  Points.m
//  TrailerGame
//
//  Created by Woo Hyun Jin on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Points.h"

static NSMutableArray *points;

@implementation Points

@synthesize movieTitle;
@synthesize posterName;
@synthesize timeSpent;
@synthesize pointsEarned;
@synthesize movieId;

+ (NSMutableArray *) GetGamePointsSample
{
    NSMutableArray * list = [[NSMutableArray alloc]init];
    Points * point = [[Points alloc]init];
    point.movieId = 1;
    point.pointsEarned = 10;
    point.timeSpent = 65;
    point.movieTitle = @"Skyfall";
    point.posterName = @"220px-Skyfall_poster.jpg";
    [list addObject:point];
    
    point.movieId = 2;
    point.pointsEarned = 20;
    point.timeSpent = 128;
    point.movieTitle = @"Iron Man 3";
    point.posterName = @"220px-Iron_Man_3_teaser_poster.jpg";
    [list addObject:point];
    
    point.movieId = 1;
    point.pointsEarned = 10;
    point.timeSpent = 609;
    point.movieTitle = @"The Dark Knight Rises";
    point.posterName = @"220px-Dark_Knight.jpg";
    [list addObject:point];
    
    point.movieId = 1;
    point.pointsEarned = 10;
    point.timeSpent = 45;
    point.movieTitle = @"The Lion King";
    point.posterName = @"220px-The_Lion_King_poster.jpg";
    [list addObject:point];
    
    return list;
}

+ (NSMutableArray *) GetGamePoints
{
    return points;
}

+ (void) AddGamePoints:(Points *)point;
{
    if (points == nil)
    {
        points = [NSMutableArray new];
    }
    [points addObject:point];
}

- (void)initValues:(NSString *)title name:(NSString *)name time:(NSTimeInterval)time points:(int)points mId:(int)mId
{
    movieTitle = title;
    posterName = name;
    timeSpent = time;
    pointsEarned = points;
    movieId = mId;
}


@end
