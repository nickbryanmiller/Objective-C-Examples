//
//  NSString+FormattingOptions.m
//  FirstApplication
//
//  Created by Nicholas Miller on 12/27/16.
//  Copyright © 2016 nickbryanmiller. All rights reserved.
//

#import "NSString+FormattingOptions.h"

@implementation NSString (FormattingOptions)

- (NSString *)convertWhiteSpace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@"_"];
}

@end
