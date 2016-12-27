//
//  Employee.h
//  FirstApplication
//
//  Created by Nicholas Miller on 12/26/16.
//  Copyright © 2016 nickbryanmiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject <NSCoding>

// Properties
@property NSString *firstName;
@property NSString *lastName;
@property NSDate *hireDate;
@property int employeeNumber;

// Methods
- (void) someMethod; // method with no parameters

@end
