//
//  Points.m
//  TrailerGame
//
//  Created by Woo Hyun Jin on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Points.h"

@implementation Points

@synthesize movieId;
@synthesize pointsEarned;
@synthesize timeSpent;
@synthesize movieTitle;
@synthesize posterName;

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
}

+ (void) AddGamePoints
{
    
}

@end
