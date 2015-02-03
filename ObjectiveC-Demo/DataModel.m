//
//  DataModel.m
//  ObjectiveC-Demo
//
//  Created by David M Reed on 2/3/15.
//  Copyright (c) 2015 David M Reed. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
{
    // add any private instance variables here
    NSString *_middleName;
}

// + for class method
+ (DataModel*)dataModelForMe {
    DataModel *d = [[DataModel alloc] init];
    d.firstName = @"Dave";
    d.lastName = @"Reed";
    d.age = 42; // I wish
    return d;
}

// - for instance method
// each colon corresponds to a parameter (after the colon is the type inside parentheses followed by the formal parameter name
// alloc, init, 
- (id)initWithFirstName:(NSString*)first lastName:(NSString*)last age:(int)age {
    // must call designated initializer for base class (which for NSObject is plain "init") when writing your own initializer
    self = [super init];
    if (self) {
        self.firstName = first;
        self.lastName = last;
        self.age = age;
    }
    return self;
}

// - for instance method
// this is metod called whenever we want a string representation of the object (similar to __str__ in Python)
- (NSString*)description {
    // properties have backing store instance variables with leading _ (or can use self. notation to access the property)
    // always use self. property notation when setting a property to ensure correct reference counting
    return [[NSString alloc] initWithFormat:@"%@ %@", self.firstName, _lastName];
}


@end
