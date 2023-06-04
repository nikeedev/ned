module main

import os
import gg
import gx
import term

const (
	version = '0.1-alpha'

)

const (
	fpath = os.resource_abs_path('RobotoMono-Regular.ttf')
)

[heap]
struct Ned {
mut:
	ctx &gg.Context = unsafe { nil }
	win_size gg.Size
}

[console]
fn main() {
	if os.args.len < 2 {
		println("ned - Nikita's code editor - v${version}")
		println('Usage: ned <file> --[options]')
		return
	}

	mut window_size := gg.screen_size()

	if window_size.width == 0 || window_size.height == 0 {
		window_size = gg.Size { width: 800, height: 600 }
	} else {
		gg.toggle_fullscreen()
	}

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
		font_path: fpath
	)
	ned.ctx.run()
}


fn init(mut ned &Ned) {

}


fn keydown(mut ned &Ned) {

}

fn (mut ned Ned) draw() {
    ned.ctx.draw_text(0, 0, "Hello, NED!", gx.TextCfg{
        size: 32,
        align: gx.align_left,
		color: gx.black
    })
}

fn frame(mut ned &Ned) {
	ned.ctx.begin()
	ned.draw()
	ned.ctx.end()
}
