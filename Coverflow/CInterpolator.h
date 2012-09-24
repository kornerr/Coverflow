//
//  CInterpolator.h
//  NewScroller
//
//  Created by Jonathan Wight on 9/6/12.
//  Copyright (c) 2012 toxicsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CInterpolator : NSObject

@property (readwrite, nonatomic, copy) NSArray *keys;
@property (readwrite, nonatomic, copy) NSArray *values;

+ (CInterpolator *)interpolator;
+ (CInterpolator *)interpolatorWithDictionary:(NSDictionary *)inDictionary;

- (CGFloat)interpolatedValueForKey:(CGFloat)key;

@end

#pragma mark -

@interface CInterpolator (Convenience)
- (NSArray *)interpolatedValuesForKeys:(NSArray *)inKeys;
@end