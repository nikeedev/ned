module main

import os
import gg
import gx
import term

const (
	version = '0.1-alpha'
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
		frame_fn: frame
		user_data: ned
		init_fn: init
	)
	ned.ctx.run()
}


fn init(mut ned &Ned) {
	// app.img.img = app.ctx.create_image(os.resource_abs_path(app.file_name))
    // app.img.pos = Vec2{60, 60}
    // app.img.size = 2
}

fn (mut ned Ned) draw() {
    // app.ctx.draw_image(app.img.pos.x, app.img.pos.y, app.img.img.width*app.img.size, app.img.img.height*app.img.size, app.img.img)
}

fn frame(mut ned &Ned) {
	// app.img.vel.x = 0
	// app.img.vel.y = 0


	// if app.ctx.pressed_keys[int(gg.KeyCode.a)] || app.ctx.pressed_keys[int(gg.KeyCode.left)] {
	// 	println("Left key down")
	// 	app.img.vel.x -= speed
	// }

	// if app.ctx.pressed_keys[int(gg.KeyCode.d)] || app.ctx.pressed_keys[int(gg.KeyCode.right)] {
	// 	println("Right key down")
	// 	app.img.vel.x += speed
	// }

	// if app.ctx.pressed_keys[int(gg.KeyCode.w)] || app.ctx.pressed_keys[int(gg.KeyCode.up)] {
	// 	println("Up key down")
	// 	app.img.vel.y -= speed
	// }

	// if app.ctx.pressed_keys[int(gg.KeyCode.s)] || app.ctx.pressed_keys[int(gg.KeyCode.down)] {
	// 	println("Down key down")
	// 	app.img.vel.y += speed
	// }


	// if app.ctx.pressed_keys[int(gg.KeyCode.escape)] {
	// 	exit(0)
	// }

	// app.img.pos.x += app.img.vel.x
	// app.img.pos.y += app.img.vel.y


	ned.ctx.begin()
	ned.draw()
	ned.ctx.end()
}
