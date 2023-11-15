module main

import os
import gg
import gx
import term

const (
	version = '0.1-alpha'

)

const (
	font_path = os.resource_abs_path('JetBrainsMono-Regular.ttf')
)

struct Ned {
mut:
	ctx &gg.Context = unsafe { nil }
	win_size gg.Size
}

[console]
fn main() {
	// if os.args.len < 2 {
	// 	println("ned - Nikita's code editor - v${version}")
	// 	println('Usage: ned <file> --[options]')
	// 	return
	// }

	mut window_size := gg.screen_size()

	mut ned := &Ned {
		ctx: 0,
		win_size: window_size
    }

	ned.ctx = gg.new_context(
		bg_color: gx.white
		width: window_size.width
		height: window_size.height
		create_window: true
		window_title: "Ned"
		user_data: ned
		frame_fn: frame
		init_fn: init
		keydown_fn: keydown
		font_path: font_path
	)
	ned.ctx.run()
}


fn init(mut ned &Ned) {

}


fn keydown(c gg.KeyCode, m gg.Modifier, mut ned &Ned) {

}

[live]
fn (mut ned Ned) draw() {
    ned.ctx.draw_text(0, 0, "Hello, NED! !\"\"= == => >= << >> < > : - :=\n 0123456789", gx.TextCfg{
        size: 32,
        align: gx.align_left,
		color: gx.hex(0x3c3f63ff)
    })
}

fn frame(mut ned &Ned) {
	if ned.ctx.pressed_keys[gg.KeyCode.escape] {
		exit(0)
	}

	ned.ctx.begin()
	ned.draw()
	ned.ctx.end()
}
