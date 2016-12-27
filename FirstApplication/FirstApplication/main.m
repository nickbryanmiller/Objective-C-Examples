//
//  main.m
//  FirstApplication
//
//  Created by Nicholas Miller on 12/26/16.
//  Copyright © 2016 nickbryanmiller. All rights reserved.
//

// NOTE: <> is for external headers and "" is for files in the project

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "MathUtil.h"
#import "Player.h"
#import "NSString+FormattingOptions.h"

void printBelow(void);
void doNotForgetCodeSnippets(void);

void printMinutes(void) {
    int minutes = 60;
    int hours = 24;
    int days = 365;
    int minInYear = minutes * hours * days;
    NSLog(@"There are %i minutes in year %i", minInYear, 2016);
    
    // float literal
    float myFloat = 3.55f;
    NSLog(@"My float is %f", myFloat);
}

void doIfStatement(void) {
    // Objective-C boolean
    BOOL condition = YES;
    if (condition || condition == YES) {
        NSLog(@"condition was %i", condition);
    }
    
    // Works but is C boolean
    bool myBool = (condition) ? true : false;
    NSLog(@"myBool was %i", myBool);
}

void doLoops(void) {
    int a = 0;
    while (a < 20) { a = a + 1; }
    
    for (int i = 0; i < 10; i++) { /* do stuff */ }
}

int sum(int a, int b) {
    return a + b;
}
void printSum(int a, int b) {
    NSLog(@"The sum of %i and %i is: %i", a, b, sum(a, b));
}

NSString* getString(NSString *s) {
    return s;
}
void printString(NSString *s) {
    NSLog(@"%@", getString(s));
}

void printTheDate(void) {
    // This calls the CLASS method date inside of NSDate to get the current date
    // In the documentation + means a class method and - means an instance method
    // date is an autorelease object that before giving to us gets put in an autorelease pool
    NSDate *today = [NSDate date];
    NSLog(@"the date is %@", today);
}

void incrementByOne(int *a) {
    *a = *a + 1;
}
void incByReference(int a) {
    incrementByOne(&a);
    NSLog(@"The number is %i", a);
    incrementByOne(&a);
    NSLog(@"The number is %i", a);
}

void doEnumExample(void) {
    enum seatPreference { window, middle, aisle };
    
    enum seatPreference bobSeatPreference = window;
    // enum seatPreference fredSeatPreference = aisle;
    
    if (bobSeatPreference == window) {
        NSLog(@"Bob wants a %i which is a window", window);
    }
}

void printUppercase(NSString *s) {
    NSString *message = [s uppercaseString];
    NSLog(@"The uppercase version is %@", message);
}

void instantiateDateObject(void) {
    // Objective-C way
    // These are pre-ARC and in pre-ARC need to be released
    NSDate *myDate = [[NSDate alloc] init];
    NSLog(@"the date is %@", myDate);
    
    /* Explanation
    NSDate *myDate; // Declare it
    myDate = [NSDate alloc];    // allocate memory
    myDate = [myDate init];    // initialize
    */
    
    // Allowed but is weird
    // NSDate *myDate = [NSDate new];
    
    // another example with multiple arguments
    // NSDate *nextDate = [[NSDate alloc] initWithTimeInterval:23234544 sinceDate:myDate];
    // NSLog(@"the date is %@", nextDate);
}

void doEmployeeMethod(void) {
    Employee *fred = [[Employee alloc] init];
    
    [fred setFirstName:@"Fred"]; // All the sets and gets are made for you
    [fred someMethod]; // call a method in employee
    
    //could also use . syntax
    Employee *alice = [[Employee alloc] init];
    alice.firstName = @"alice";
}

void doMathUtilMethod(void) {
    MathUtil *m = [[MathUtil alloc] init];
    int a = 5;
    int b = 10;
    NSLog(@"The number %i * 10 is: %i", a, [m timesTen:a]);
    NSLog(@"The sum of %i and %i is: %i", a, b, [m addNumber:a toNumber:b]);
}

void doPlayerMethod(void) {
    Player *player = [[Player alloc] init];
    NSLog(@"The initial score is: %i", [player score]);
    NSLog(@"The other initial score is: %i", [player otherScore]);
    
    Player *player2 = [[Player alloc] initWithScore:500 andOtherScore:300];
    NSLog(@"The initial score is: %i", [player2 score]);
    NSLog(@"The other initial score is: %i", [player2 otherScore]);
}

void doArrayMethod(void) {
    // Objective-C arrays
    // Mark end of array with nil, there is bounds checking, and is immutable
    // NSArray's hold AnyObjects so anything can go in it
    NSArray *myArray = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", nil];
    NSLog(@"The third value in the array is: %@", [myArray objectAtIndex:2]);
    
    NSMutableArray *myMutableArray = [[NSMutableArray alloc] initWithObjects:@"a", @"b", @"c", nil];
    [myMutableArray removeObjectAtIndex:0];
    [myMutableArray addObject:@"d"];
    NSLog(@"The third value in the mutable array is: %@", [myMutableArray objectAtIndex:2]);
    
    // Note in C arrays there is no bounds checking
    // int multipleValues[5] = { 10, 100, 1000, 10000, 100000 };
    // NSLog(@"The third value in the array is: %i", multipleValues[2]);
    // Can also leave off the 5 in C
    // int multipleValues2[] = { 10, 100, 1000, 10000, 100000 };
    
    // Can leave off nil in newer Objective-C by useing @ (DOES NOT WORK WITH MUTABLE)
    Player *play = [[Player alloc] init];
    NSArray *shorthandExample = @[ @1, play, @"hello", @'f'];
    
    // For fast enumeration
    for (NSObject *ele in shorthandExample) {
        NSLog(@"The value is: %@", ele);
    }
}

void doDictionaryMethod(void) {
    // Notice it expects the object followed by the key and not as a pair
    NSDictionary *states = [[NSDictionary alloc]
                            initWithObjectsAndKeys:@"Arizona", @"AZ",
                            @"California", @"CA",
                            @"Colorado", @"CO",
                            @"Hawaii", @"HI",
                            @"New Mexico", @"NM",
                            nil];
    NSString *someState = @"AZ";
    NSLog(@"The state with abbreviation %@ is: %@", someState, [states objectForKey:someState]);
    
    // The short hand is:
    NSString *someState2 = @"HI";
    NSLog(@"The state with abbreviation %@ is: %@", someState2, states[someState2]);
    
    //NSMutableDictionary
    NSMutableDictionary *mutableStates = [[NSMutableDictionary alloc]
                            initWithObjectsAndKeys:@"Arizona", @"AZ",
                            @"California", @"CA",
                            @"Colorado", @"CO",
                            @"Hawaii", @"HI",
                            @"New Mexico", @"NM",
                            nil];
    // This is how you update it
    [mutableStates setObject:@"Florida" forKey:@"FL"];
    
    // Short hand and notice that here is key : value
    // NSDictionary *quicker = @{@"FL": @"Florida", @"GA": @"Georgia", @"NY": @"New York"};
}

void doFastEnumerationExample(void) {
    
    NSString *soundPath = @"/System/Library/Sounds/";
    NSFileManager *fileManager = [[NSFileManager alloc] init ];
    NSArray *soundFiles = [fileManager subpathsAtPath:soundPath];
    
    for (NSString *file in soundFiles) {
        NSLog(@"The file name is: %@", file);
    }
}

void doFileExample(void) {
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *simplePath = @"/Users/nicholasmiller/Desktop/University of Florida/Official Resume.pdf";
    
    if ([fileManager fileExistsAtPath:simplePath]) {
        NSLog(@"It does exist");
        NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:simplePath error:nil];
        
        for (NSString *ele in fileAttributes) {
            NSLog(@"The key for the file is: %@", ele);
        }
        NSLog(@"The file size is: %@", [fileAttributes objectForKey:@"NSFileSize"]);
    }
    else {
        NSLog(@"It does not exist");
    }
}

void doDirectoryExample(void) {
    
    // Simple function call from C
    NSString *homeDirectoryC = NSHomeDirectory();
    NSString *desktopPath = [homeDirectoryC stringByAppendingPathComponent:@"Desktop"];
    NSLog(@"%@", desktopPath);
    
    // More Complicated but allows full control and NSURL are faster
    // NOTE default is a reference to the shared default manager so no need to worry about multiple instances
    /*
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentDirectory = [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSLog(@"%@", documentDirectory);
    */
}

void doReadAndWriteFileExample(void) {
    NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *full = [documentDirectory URLByAppendingPathComponent:@"sample.txt"];
    NSMutableString *content = [[NSMutableString alloc] initWithContentsOfURL:full encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@", content);
    
    [content appendString:@"\nChanged"];
    
    NSURL *saveLocation = [documentDirectory URLByAppendingPathComponent:@"sampleChanged.txt"];
    [content writeToURL:saveLocation atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

void doArchiverExample(void) {
    Employee *alice = [[Employee alloc] init];
    alice.firstName = @"Alice";
    alice.lastName = @"Miller";
    alice.employeeNumber = 123456;
    alice.hireDate = [[NSDate alloc] init];
    
    Employee *bob = [[Employee alloc] init];
    bob.firstName = @"Bob";
    bob.lastName = @"Muller";
    bob.employeeNumber = 654321;
    bob.hireDate = [[NSDate alloc] init];

    // Can only archive itself if all the objects inside can archive itself
    NSMutableArray *employees = [[NSMutableArray alloc] init];
    [employees addObject:alice];
    [employees addObject:bob];
    
    // Save code here
    [NSKeyedArchiver archiveRootObject:employees toFile:@"/Users/nicholasmiller/Desktop/employees.plist"];
}

void doUnArchiveExample(void) {
    NSMutableArray *employees = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/nicholasmiller/Desktop/employees.plist"];
    
    for (Employee *emp in employees) {
        NSLog(@"%@", emp.firstName);
    }
}

void doCategoryExample(void) {
    NSString *word = @"Hello my name is nick";
    NSLog(@"Changed String is: %@", [word convertWhiteSpace]);
}

void doDynamicTypeExample(void) {
    
    Player *play = [[Player alloc] init];
    NSArray *shorthandExample = @[ @1, play, @"hello", @'f'];
    
    // isKindOfClass works here
    for (id ele in shorthandExample) {
        if ([ele isKindOfClass:[Player class]]) {
            NSLog(@"The value is: %@", ele);
        }
    }
    // Another way is to see if it responds
    // NOTE this is the preferred way because we only need to check if that operation is supported
    for (id ele in shorthandExample) {
        if ([ele respondsToSelector:@selector(conformingMethod1)]) {
            NSLog(@"The value is: %@", ele);
        }
    }
}

void doExceptionHandling(void) {
    @try {
        id today = [[NSDate alloc] init];
        [today uppercaseString];
    } @catch (NSException *exception) {
        NSLog(@"There was an exception");
    } @finally {
        //Code that gets executed whether or not an exception is thrown
    }
}

int main(int argc, const char * argv[]) {
    
    // This is for creating a temp retain and then dumping it
    @autoreleasepool {
        // insert code here...
        // NSLog(@"Hello, Nick!");
        
//        printMinutes();
//        doIfStatement();
//        doLoops();
//        printBelow();
//        printSum(5, 3);
//        printString(@"I am a string literal");
//        printTheDate();
//        incByReference(4);
//        doEnumExample();
//        printUppercase(@"hello");
//        instantiateDateObject();
//        doEmployeeMethod();
//        doMathUtilMethod();
//        doPlayerMethod();
//        doArrayMethod();
//        doDictionaryMethod();
//        doFastEnumerationExample();
//        doFileExample();
//        doDirectoryExample();
//        doReadAndWriteFileExample();
//        doArchiverExample();
//        doUnArchiveExample();
//        doCategoryExample();
//        doDynamicTypeExample();
//        doExceptionHandling();
        
    }
    
    return 0;
}

// Objective-C does not care about white space
void printBelow(void) { NSLog(@"I have a function protocol at the top called printBelow();"); }

void doNotForgetCodeSnippets(void) {
    // Pre-written code snippets are written for you in the code snippet library in the right pane
}




