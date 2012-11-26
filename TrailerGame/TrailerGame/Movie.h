//
//  Movie.h
//  TrailerGame
//
//  Created by Ibrahim Abdul Rahim on 11/11/12.
//
//

#import <Foundation/Foundation.h>

@class MovieCategory;

@interface Movie : NSObject

@property (nonatomic) int movieId;
@property (nonatomic, retain) NSString *movieName;
@property (nonatomic, retain) NSString *youtubeURL;

@property (nonatomic, retain) NSString *choiceOne;
@property (nonatomic, retain) NSString *choiceTwo;
@property (nonatomic, retain) NSString *choiceThree;
@property (nonatomic, retain) NSString *choiceFour;

- (void)initValues:(int)mId name:(NSString *)name url:(NSString *)url one:(NSString *)one two:(NSString *)two three:(NSString *)three four:(NSString *)four;
@end

//this section is commented out: currently we will not be maintaining local database for the app
//all the necessary database functionality will come from the server-side. 
//TODO: remove this after discussion with ibrahim
/*@interface Movie (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(MovieCategory *)value;
- (void)removeCategoriesObject:(MovieCategory *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

@end*/
