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
    int result = 0;
    NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];
    Game* game = Game::getInstance();
    Platform* platform = Platform::create(game);
    GP_ASSERT(platform);
#ifdef TESTING
    // Start the testing out
    platform->prepareMessagePump();
    testing::InitGoogleTest(&argc, argv);
    result =  RUN_ALL_TESTS();
#else
    // Start up the game
    result = platform->enterMessagePump();
#endif
    delete platform;
    [p release];
    
    return result;
    
}

#endif
