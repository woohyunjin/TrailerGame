//
//  MovieCategory.h
//  TrailerGame
//
//  Created by Ibrahim Abdul Rahim on 11/11/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Movie;

@interface MovieCategory : NSManagedObject

@property (nonatomic, retain) NSString * categoryName;
@property (nonatomic, retain) Movie *movie;

@end
