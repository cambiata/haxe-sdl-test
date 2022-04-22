import Sdl.EventType;
import Sdl.Event;

class Main {
	static function main() {
		trace('Hello from SDL2!');
		Sdl.init(Sdl.INIT_EVERYTHING);
		var win = Sdl.createWindow("Hello", 100, 100, 800, 600, Sdl.WINDOW_OPENGL);
		var ren = Sdl.createRenderer(win, -1, Sdl.RENDERER_ACCELERATED);
		var bmp = Sdl.loadBMP("../test.bmp");
		var tex = Sdl.createTextureFromSurface(ren, bmp);
		Sdl.freeSurface(bmp);
		Sdl.renderClear(ren);
		Sdl.renderCopy(ren, tex, cast 0, cast 0);
		Sdl.renderPresent(ren);
		eventLoop((eventType:EventType) -> {
			return switch eventType {
				case SDL_QUIT:
					true; // casues program quit
				default:
					switch eventType {
						case SDL_MOUSEBUTTONDOWN:
							trace('mouse button down');
						case SDL_KEYDOWN:
							trace('keydown');
						default:
					}
					false; // keep program going
			}
		});
		Sdl.destroyWindow(win);
		Sdl.quit();
	}

	static function eventLoop(eventLoopCallback:EventType->Bool) {
		var e:Event;
		var quit:Bool = false;
		while (!quit) {
			untyped __cpp__('
			while (SDL_PollEvent(&e))
			{
				quit = eventLoopCallback(e.type);
			}
			');
		}
	}
}
