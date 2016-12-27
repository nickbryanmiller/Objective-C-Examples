//
//  CustomProtocol.h
//  FirstApplication
//
//  Created by Nicholas Miller on 12/27/16.
//  Copyright © 2016 nickbryanmiller. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomProtocol <NSObject>

- (void) conformingMethod1;
- (int) conformingMethod2: (int)a withParam: (int)b;

@end
