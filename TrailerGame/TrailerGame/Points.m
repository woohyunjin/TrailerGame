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
