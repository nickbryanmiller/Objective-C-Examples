//
//  Player.m
//  FirstApplication
//
//  Created by Nicholas Miller on 12/26/16.
//  Copyright © 2016 nickbryanmiller. All rights reserved.
//

#import "Player.h"

@interface Player ()
// By default those variables in the header are public so we have to do an extension to put private variables in there
@property int privateVariable;

// What about private methods?
// Write the method as normal in the implmentation file and don't write a method signature in the interface file
// However they can go here as well
@end

@implementation Player

// Instance variables that you just want to use inside the class go here
{
    int somePrivateAttribute;
}

// Synthesize tells the compiler to actually link the property and implement the getter and setter methods
// Apparently do not need this Xcode4.4 and on
// @synthesize otherScore;

// Methods

/* INIT METHODS
- (instancetype)init {
    self = [super init];
    if (self) {
        _score = 0;
        _otherScore = 10;
    }
    return self;
}
*/
// We can clean this up by doing the below code
- (instancetype)init {
    self = [self initWithScore:0 andOtherScore:10];
    return self;
}
// Because the below init has the most parameters
- (instancetype)initWithScore: (int)initialScore andOtherScore: (int)otherInitialScore {
    self = [super init];
    if (self) {
        _score = initialScore;
        _otherScore = otherInitialScore;
    }
    return self;
}

// DEALLOC METHODS
- (void)dealloc {
    // If you are pre-ARC you would release all the resources and references that this class was holding
    // For instance if you had an object that keeps a connection to a database you would want to close the connection when the object gets deallocated
    
    // You would also need to call [super dealloc] to clean the parent too
}

// Custom Methods
- (int)score {
    return _score;
}

- (void)setScore:(int)amount {
    _score = amount;
}

// protocol methods
- (void)conformingMethod1 {}
- (int)conformingMethod2:(int)a withParam:(int)b { return 0; }

@end









