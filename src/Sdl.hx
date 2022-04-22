import cpp.ConstCharStar;

@:include("./SDLSupport.h")
// Windows:
@:buildXml('<target id="haxe"><lib name="../../SDL2-2.0.3/lib/x86/SDL2.lib"/></target>')
// macOS:
// @:buildXml('<target id="haxe"><lib name="/Library/Frameworks/SDL2.framework/Versions/A/SDL2"/></target>')
extern class Sdl {
	@:native("SDL_INIT_EVERYTHING")
	static var INIT_EVERYTHING(default, null):InitFlag;

	inline static var WINDOW_NONE:CreateWindowFlag = cast 0;

	@:native("SDL_WINDOW_OPENGL")
	static var WINDOW_OPENGL(default, null):CreateWindowFlag;

	inline static var RENDERER_NONE:CreateRendererFlag = cast 0;

	@:native("SDL_RENDERER_ACCELERATED")
	static var RENDERER_ACCELERATED(default, null):CreateRendererFlag;

	@:native("SDL_Init")
	static function init(flags:InitFlag):Int;

	@:native("SDL_CreateWindow")
	static function createWindow(title:ConstCharStar, x:Int, y:Int, w:Int, h:Int, flags:CreateWindowFlag):WindowPointer;

	@:native("SDL_DestroyWindow")
	static function destroyWindow(window:WindowPointer):Void;

	@:native("SDL_CreateRenderer")
	static function createRenderer(win:WindowPointer, index:Int, flags:CreateRendererFlag):RendererPointer;

	@:native("SDL_LoadBMP")
	static function loadBMP(file:ConstCharStar):SurfacePointer;

	@:native("SDL_CreateTextureFromSurface")
	static function createTextureFromSurface(renderer:RendererPointer, surface:SurfacePointer):TexturePointer;

	@:native("SDL_FreeSurface")
	static function freeSurface(surface:SurfacePointer):Void;

	@:native("SDL_RenderClear")
	static function renderClear(renderer:RendererPointer):Int;

	@:native("SDL_RenderCopy")
	static function renderCopy(renderer:RendererPointer, texture:TexturePointer, srcRect:RectPointer, dstRect:RectPointer):Int;

	@:native("SDL_RenderPresent")
	static function renderPresent(renderer:RendererPointer):Void;

	@:native("SDL_Quit")
	static function quit():Void;

	@:native("SDL_Delay")
	static function delay(ms:cpp.UInt32):Void;
}

abstract InitFlag(cpp.UInt32) {
	@:op(A | B) static function _(a:InitFlag, b:InitFlag):InitFlag;
}

abstract CreateWindowFlag(cpp.UInt32) {
	@:op(A | B) static function _(a:CreateWindowFlag, b:CreateWindowFlag):WindowPointer;
}

abstract CreateRendererFlag(cpp.UInt32) {
	@:op(A | B) static function _(a:CreateRendererFlag, b:CreateRendererFlag):CreateRendererFlag;
}

@:native("::cpp::Reference<SDL_Window>")
extern class WindowPointer {}

@:native("::cpp::Reference<SDL_Renderer>")
extern class RendererPointer {}

@:native("::cpp::Reference<SDL_Surface>")
extern class SurfacePointer {}

@:native("::cpp::Reference<SDL_Texture>")
extern class TexturePointer {}

@:native("::cpp::Reference<SDL_Rect>")
extern class RectPointer {}

//--------------------------------------------------------------------------------------------

@:native("SDL_Event")
@:extern class Event {
	public var type:EventType;
	public var mouseX:Int;
	public var mouseY:Int;
	public var mouseXRel:Int;
	public var mouseYRel:Int;
	public var button:Int;
	public var wheelDelta:Int;
	public var state:WindowEventID;
	public var keyCode:Int;
	public var scanCode:Int;
	public var keyRepeat:Bool;
	public var controller:Int;
	public var value:Int;
	public var fingerId:Int;
	public var joystick:Int;

	public function new() {}
}

enum abstract WindowEventID(Int) from Int to Int {
	var SDL_WINDOWEVENT_NONE = 0; // Never used
	var SDL_WINDOWEVENT_SHOWN = 1; // Window has been shown
	var SDL_WINDOWEVENT_HIDDEN = 2; // Window has been hidden
	var SDL_WINDOWEVENT_EXPOSED = 3; // Window has been exposed and should be redrawn
	var SDL_WINDOWEVENT_MOVED = 4; // Window has been moved to data1, data2
	var SDL_WINDOWEVENT_RESIZED = 5; // Window has been resized to data1xdata2
	var SDL_WINDOWEVENT_SIZE_CHANGED = 6; // The window size has changed, either as a result of an API call or through the system or user changing the window size.
	var SDL_WINDOWEVENT_MINIMIZED = 7; // Window has been minimized
	var SDL_WINDOWEVENT_MAXIMIZED = 8; // Window has been maximized
	var SDL_WINDOWEVENT_RESTORED = 9; // Window has been restored to normal size and position
	var SDL_WINDOWEVENT_ENTER = 10; // Window has gained mouse focus
	var SDL_WINDOWEVENT_LEAVE = 11; // Window has lost mouse focus
	var SDL_WINDOWEVENT_FOCUS_GAINED = 12; // Window has gained keyboard focus
	var SDL_WINDOWEVENT_FOCUS_LOST = 13; // Window has lost keyboard focus
	var SDL_WINDOWEVENT_CLOSE = 14; // The window manager requests that the window be closed
}

enum abstract EventType(UInt) from UInt to UInt {
	var SDL_FIRSTEVENT = 0; /**< Unused (do not remove) */

	var SDL_QUIT = 0x100; /**< User-requested quit */

	var SDL_APP_TERMINATING = 0x101;

	/**< The application is being terminated by the OS
		Called on iOS in applicationWillTerminate()
		Called on Android in onDestroy()
	 */
	var SDL_APP_LOWMEMORY = 0x102;

	/**< The application is low on memory, free memory if possible.
		Called on iOS in applicationDidReceiveMemoryWarning()
		Called on Android in onLowMemory()
	 */
	var SDL_APP_WILLENTERBACKGROUND = 0x103;

	/**< The application is about to enter the background
		Called on iOS in applicationWillResignActive()
		Called on Android in onPause()
	 */
	var SDL_APP_DIDENTERBACKGROUND = 0x104;

	/**< The application did enter the background and may not get CPU for some time
		Called on iOS in applicationDidEnterBackground()
		Called on Android in onPause()
	 */
	var SDL_APP_WILLENTERFOREGROUND = 0x105;

	/**< The application is about to enter the foreground
		Called on iOS in applicationWillEnterForeground()
		Called on Android in onResume()
	 */
	var SDL_APP_DIDENTERFOREGROUND = 0x106;

	/**< The application is now interactive
		Called on iOS in applicationDidBecomeActive()
		Called on Android in onResume()
	 */
	/* Window events */
	var SDL_WINDOWEVENT = 0x200; /**< Window state change */

	var SDL_SYSWMEVENT = 0x201; /**< System specific event */

	/* Keyboard events */
	var SDL_KEYDOWN = 0x300; /**< Key pressed */

	var SDL_KEYUP = 0x301; /**< Key released */

	var SDL_TEXTEDITING = 0x302; /**< Keyboard text editing (composition) */

	var SDL_TEXTINPUT = 0x303; /**< Keyboard text input */

	/* Mouse events */
	var SDL_MOUSEMOTION = 0x400; /**< Mouse moved */

	var SDL_MOUSEBUTTONDOWN = 0x401; /**< Mouse button pressed */

	var SDL_MOUSEBUTTONUP = 0x402; /**< Mouse button released */

	var SDL_MOUSEWHEEL = 0x403; /**< Mouse wheel motion */

	/* Joystick events */
	var SDL_JOYAXISMOTION = 0x600; /**< Joystick axis motion */

	var SDL_JOYBALLMOTION = 0x601; /**< Joystick trackball motion */

	var SDL_JOYHATMOTION = 0x602; /**< Joystick hat position change */

	var SDL_JOYBUTTONDOWN = 0x603; /**< Joystick button pressed */

	var SDL_JOYBUTTONUP = 0x604; /**< Joystick button released */

	var SDL_JOYDEVICEADDED = 0x605; /**< A new joystick has been inserted into the system */

	var SDL_JOYDEVICEREMOVED = 0x606; /**< An opened joystick has been removed */

	/* Game controller events */
	var SDL_CONTROLLERAXISMOTION = 0x650; /**< Game controller axis motion */

	var SDL_CONTROLLERBUTTONDOWN = 0x651; /**< Game controller button pressed */

	var SDL_CONTROLLERBUTTONUP = 0x652; /**< Game controller button released */

	var SDL_CONTROLLERDEVICEADDED = 0x653; /**< A new Game controller has been nserted into the system */

	var SDL_CONTROLLERDEVICEREMOVED = 0x654; /**< An opened Game controller has been removed */

	var SDL_CONTROLLERDEVICEREMAPPED = 0x655; /**< The controller mapping was updated */

	/* Touch events */
	var SDL_FINGERDOWN = 0x700;
	var SDL_FINGERUP = 0x701;
	var SDL_FINGERMOTION = 0x702;
	/* Gesture events */
	var SDL_DOLLARGESTURE = 0x800;
	var SDL_DOLLARRECORD = 0x801;
	var SDL_MULTIGESTURE = 0x802;
	/* Clipboard events */
	var SDL_CLIPBOARDUPDATE = 0x900; /**< The clipboard changed */
	/* Drag and drop events */
	var SDL_DROPFILE = 0x1000; /**< The system requests a file open */
	/* Render events */
	var SDL_RENDER_TARGETS_RESET = 0x2000; /**< The render targets have been reset and their contents need to be updated */

	var SDL_RENDER_DEVICE_RESET = 0x2001; /**< The device has been reset and all textures need to be recreated */

	/** Events ::SDL_USEREVENT through ::SDL_LASTEVENT are for your use,
	 *  and should be allocated with SDL_RegisterEvents()
	 */
	var SDL_USEREVENT = 0x8000;

	/**
	 *  This last event is only for bounding internal arrays
	 */
	var SDL_LASTEVENT = 0xFFFF;
} // SDLEventType
