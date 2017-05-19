curl -O https://www.libsdl.org/release/SDL2-2.0.5.tar.gz
tar zvxf SDL2-2.0.5.tar.gz
mv SDL2-2.0.5 SDL
mv SDL/android-project/jni/src/Android_static.mk SDL/android-project/jni/src/Android.mk
echo "APP_CPPFLAGS += -std=c++11\nAPP_STL := c++_static\nAPP_ABI := armeabi-v7a arm64-v8a\nAPP_PLATFORM=android-10\n" > SDL/android-project/jni/Application.mk
# Creates a dummy main file to trigger building.
echo "#include \"SDL.h\"\nint main() {\n    return 0;\n}\n" > SDL/android-project/jni/src/YourSourceHere.c
ndk-build NDK_MODULE_PATH="$PWD" NDK_PROJECT_PATH=SDL/android-project
# static libs will be in SDL/android-project/obj/local/
