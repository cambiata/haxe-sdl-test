import Sdl.SdlEvent;

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
		var e:SdlEvent;
		var quit:Bool = false;
		while (!quit) {
			untyped __cpp__('
			while (SDL_PollEvent(&e))
			{
				if (e.type == SDL_QUIT)
				{
					quit = true;
				}
				if (e.type == SDL_KEYDOWN)
				{
					quit = true;
				}
				if (e.type == SDL_MOUSEBUTTONDOWN)
				{
					quit = true;
				}
			}
		');
		}
		Sdl.destroyWindow(win);
		Sdl.quit();
	}
}
