//
//  Player.h
//  FirstApplication
//
//  Created by Nicholas Miller on 12/26/16.
//  Copyright © 2016 nickbryanmiller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomProtocol.h"

@interface Player : NSObject <CustomProtocol>

// By default those variable are public

// These are instance variables (ivars) and is the old way but still legal
{
    int _score;
}

// Properties
@property int otherScore;
// Properties With Attributes
// This class owns this object and as long as we keep a reference ARC will not free that object
// Strong is the current default
@property (strong) NSString *firstName;
// This means that ARC will keep it as long as some OTHER object holds a STRONG reference to it
// A weak reference by another class is not enough to keep it alive from ARC
@property (weak) NSString *lastName;
// A readonly attribute will only create a getter and not a setter
@property (readonly) int playerSSN;
// A nonatomic attribute deals with thread safety and the string cannot be accessed concurrently to keep consistency
@property (nonatomic) NSString *playerFile;

//If we want a private variable we put it in the extension or we set it to read only
//@property (readonly) int privateVariable;


- (instancetype) initWithScore: (int)initialScore andOtherScore: (int)otherInitialScore;
- (int) score; // This is the getter and apparently a standard in Object-C to not put "get" in the method name
- (void) setScore: (int)amount;

// These are the two methods we must conform to
- (void)conformingMethod1;
- (int)conformingMethod2:(int)a withParam:(int)b;

@end
