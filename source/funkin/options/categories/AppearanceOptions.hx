package funkin.options.categories;

class AppearanceOptions extends OptionsScreen {
	public override function new() {
		super("Appearance", "Change Appearance options such as Flashing menus...");
		add(new NumOption(
			"Framerate",
			"Pretty self explanatory, isn't it?",
			30, // minimum
			320, // maximum
			5, // change
			"framerate", // save name or smth
			__changeFPS)); // callback
		add(new Checkbox(
			"Antialiasing",
			"If unchecked, will disable antialiasing on every sprite. Can boost performances at the cost of sharper, more pixely sprites.",
			"antialiasing"));
		add(new Checkbox(
			"Colored Healthbar",
			"If unchecked, the game will use the original red/green health bar from the vanilla version of the game.",
			"colorHealthBar"));
		add(new Checkbox(
			"Pixel Perfect Effect",
			"If checked, Week 6 will have a pixel perfect effect to it enabled, aligning every pixel on the screen.",
			"week6PixelPerfect"));
		add(new Checkbox(
			"Note Splashes",
			"If checked, notes will play a splash animation when getting a \"Sick!\" hit.",
			"splashesEnabled"));
		add(new Checkbox(
			"Gameplay Shaders",
			"If unchecked, gameplay shaders (visual effects like Thorns's Chromatic Aberration) wont be loaded; this may be helpful on weak devices.",
			"gameplayShaders"));
		add(new Checkbox(
			"Flashing Menu",
			"If unchecked, will disable menu flashing when you select an option in the Main Menu, and other flashes will be slower.",
			"flashingMenu"));
		add(new Checkbox(
			"Low Memory Mode",
			"If checked, will disable certain background elements in stages to reduce memory usage.",
			"lowMemoryMode"));
		#if sys
		if (!Main.forceGPUOnlyBitmapsOff) {
			add(new Checkbox(
				"VRAM-Only Sprites",
				"If checked, will only store the bitmaps in the GPU, freeing a LOT of memory (EXPERIMENTAL). Turning this off will consume a lot of memory, especially on bigger sprites. If you aren't sure, leave this on.",
				"gpuOnlyBitmaps"));
		}
		#end
		add(new Checkbox(
			"Auto Pause",
			"If checked, switching windows will pause the game.",
			"autoPause"));
	}

	private function __changeFPS(change:Float) {
		// if statement cause of the flixel warning
		if(FlxG.updateFramerate < Std.int(change))
			FlxG.drawFramerate = FlxG.updateFramerate = Std.int(change);
		else
			FlxG.updateFramerate = FlxG.drawFramerate = Std.int(change);
	}
}
