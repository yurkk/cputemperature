//
//  SMCObj.m
//  CPUTemperature
//
//  Created by yurk on 10.01.2023.
//

#import "SMCObj.h"
#import "smc.h"

@implementation SMCObj

+(double)calculateTemp {
    return calculate();
}

@end
