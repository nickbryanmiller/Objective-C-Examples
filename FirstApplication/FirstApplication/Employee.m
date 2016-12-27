//
//  Employee.m
//  FirstApplication
//
//  Created by Nicholas Miller on 12/26/16.
//  Copyright © 2016 nickbryanmiller. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (void) someMethod {
    NSLog(@"This is a method call in the %@ Employee object", _firstName);
    
    // This is also legal but an extra call
    // NSLog(@"This is a method call in the %@ Employee object", [self name]);
}

// For keyed archiver
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.firstName forKey:@"fname"];
    [aCoder encodeObject:self.lastName forKey:@"lname"];
    [aCoder encodeObject:self.hireDate forKey:@"hdate"];
    [aCoder encodeInt:self.employeeNumber forKey:@"epnum"];
}

// For keyed unarchiver
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _firstName = [aDecoder decodeObjectForKey:@"fname"];
        _lastName = [aDecoder decodeObjectForKey:@"lname"];
        _hireDate = [aDecoder decodeObjectForKey:@"hdate"];
        _employeeNumber  = [aDecoder decodeIntForKey:@"epnum"];
    }
    return self;
}

@end
