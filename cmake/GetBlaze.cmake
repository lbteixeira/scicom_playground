find_package(blaze QUIET)

if(blaze_FOUND)
   set(BLAZE_TARGET blaze::blaze)
else()
   message("")
   message("Blaze was not found in the system, using FetchContent instead.")
   message("")
   include(FetchContent)

   FetchContent_Declare(
     Blaze
     GIT_REPOSITORY https://bitbucket.org/blaze-lib/blaze.git
     GIT_TAG v3.8.1
   )

   FetchContent_MakeAvailable(Blaze)

   set(BLAZE_TARGET Blaze)
endif()

