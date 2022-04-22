# haxe-sdl-test

Experimental library for learning more about Haxe c++ target.

Using the following recources:

- Dan Korostelev's https://gist.github.com/nadako/c8aec20c2a7751348f91
- Nicolas Cannasse's https://github.com/ncannasse/hxsdl
- ruby0x1's - https://github.com/snowkit/linc_sdl

## Usage

To compile and run this project, you need Haxe 4+ installed (https://haxe.org/download)

You will need the `hxcpp` library to target c++ from haxe. In the project folder, run the following commands:

    > haxelib newrepo

    > haxelib install hxcpp

You will also need to download SDL development libraries from https://libsdl.org/download-2.0.php

### Windows

If you are on windows, make sure to download the [SDL2-devel-2.0.20-VC.zip](https://libsdl.org/release/SDL2-devel-2.0.20-VC.zip) (or whatever current version is), unzip that and copy the `SDL2-2.0.XX` folder into the project folder:


Make also sure that the `src/Sdl.hx` and `src/SDLSupport.h` files have the mac paths commented out:

```haxe
// src/Sdl.hx

// Windows:
@:buildXml('<target id="haxe"><lib name="../../SDL2-2.0.20/lib/x86/SDL2.lib"/></target>')

// macOS:
// @:buildXml('<target id="haxe"><lib name="/Library/Frameworks/SDL2.framework/Versions/A/SDL2"/></target>')
```

```cpp
// src/SDLSupport.h

// Windows:
#include "../SDL2-2.0.20/include/SDL.h"

// macOS:
// #include "/Library/Frameworks/SDL2.framework/Headers/SDL.h"
```

### Mac

If you are on mac, make sure to download the [SDL2-2.0.20.dmg](https://libsdl.org/release/SDL2-2.0.20.dmg) (or whatever current version is), and copy the the `SDL2.framework` folder into the `/Library/Frameworks/` folder on your computer.

Make also sure that the `src/Sdl.hx` and `src/SDLSupport.h` files have the mac paths commented out:

```haxe
// src/Sdl.hx

// Windows:
// @:buildXml('<target id="haxe"><lib name="../../SDL2-2.0.20/lib/x86/SDL2.lib"/></target>')

// macOS:
@:buildXml('<target id="haxe"><lib name="/Library/Frameworks/SDL2.framework/Versions/A/SDL2"/></target>')
```

```cpp
// src/SDLSupport.h

// Windows:
// #include "../SDL2-2.0.20/include/SDL.h"

// macOS:
#include "/Library/Frameworks/SDL2.framework/Headers/SDL.h"
```
