//
//  Movie.h
//  TrailerGame
//
//  Created by Ibrahim Abdul Rahim on 11/11/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MovieCategory;

@interface Movie : NSManagedObject

@property (nonatomic, retain) NSString * movieName;
@property (nonatomic, retain) NSString * youtubeUrl;
@property (nonatomic, retain) NSSet *categories;
@end

@interface Movie (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(MovieCategory *)value;
- (void)removeCategoriesObject:(MovieCategory *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

@end
