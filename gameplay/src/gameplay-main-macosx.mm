#ifdef __APPLE__

#import <Foundation/Foundation.h>
#include "gameplay.h"

#ifdef TESTING
#include <gtest/gtest.h>
#endif
using namespace gameplay;

/**
 * Main entry point.
 */
int main(int argc, char** argv)
{
#ifdef TESTING
    NSLog(@"Running main() from gtest_main.cc\n");
    testing::InitGoogleTest(&argc, argv);
    int rez =  RUN_ALL_TESTS();
    return rez;
#else
NSLog(@"Running Normally\n");
    NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];
    Game* game = Game::getInstance();
    Platform* platform = Platform::create(game);
    GP_ASSERT(platform);
    int result = platform->enterMessagePump();
    delete platform;
    [p release];
    return result;
#endif

}

#endif