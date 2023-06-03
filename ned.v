module main

import os
import gg
import gx
import term

const (
	version = '0.1-alpha'
)

fn main() {
	if os.args.len < 2 {
		println("ned - Nikita's code editor - v${version}")
		println('Usage: ned <file> --[options]')
	}
}
