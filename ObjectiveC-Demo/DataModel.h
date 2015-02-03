//
//  DataModel.h
//  ObjectiveC-Demo
//
//  Created by David M Reed on 2/3/15.
//  Copyright (c) 2015 David M Reed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

// need to use pointers for inheritance. all objects need to subclass NSObject (or some subclass of it)
// only exception is built-in types such as int, float, etc.

// see this for memory management rules:
// https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/mmRules.html#//apple_ref/doc/uid/20000994-SW1
// with ARC (available in iOS 5 and higher), no longer need (in fact it's an error) to call retain/release/autorelease

// just need to use appropriate property modifiers and only use the special names (init, copy, mutableCopy, create, when appropriate)

// property options are strong, copy, weak, assign
// strong means it will hold a reference (essentially increase reference count of object by 1)
// copy makes a separate copy of object (assuming object implements NSCopying protocol)
//      always best to use copy if there is a mutable subclass (and you don't want the changes made via another instance)
// weak means it will not hold a reference (use to prevent retain cycles)
// assign means no reference counting - use for built-in types

// nonatomic means we will ensure not accessed simultaneously by mutliple threads
// atomic means run-time will put mutex locks around (overhead so only use if necessary)
@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (assign, nonatomic) int age;

// need to declare the new methods for this class
+ (DataModel*)dataModelForMe;
- (id)initWithFirstName:(NSString*)first lastName:(NSString*)last age:(int)age;

// not necessary to declare description since we are overriding it

@end
