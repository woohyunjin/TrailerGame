//
//  Points.h
//  TrailerGame
//
//  Created by Woo Hyun Jin on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Points : NSObject

@property (nonatomic, strong) NSString *movieTitle;
@property (nonatomic, strong) NSString *posterName;
@property (nonatomic) NSTimeInterval timeSpent;
@property (nonatomic) int pointsEarned;
@property (nonatomic) int movieId;

+ (NSMutableArray *) GetGamePoints;
+ (void) AddGamePoints;

@end


