use crossterm::{
    cursor,
    event::{read, Event, KeyCode, KeyModifiers},
    terminal, QueueableCommand,
};
use std::io::{stdout, Write};

struct Vec2 {
    x: i32,
    y: i32,
}

fn main() {
    let mut stdout = stdout();

    stdout.queue(terminal::Clear(terminal::ClearType::All));

    stdout.queue(terminal::SetTitle("ned"));
    // some other code ...

    let mut pos = Vec2 { x: 5, y: 5 };

'app_loop: loop {
        let event = read().unwrap();

        //       let Event::Key(event) = event {
        //            println!("{:?}", event.code);
        //       }
        if let Event::Key(event) = event {
            match event.code {
                KeyCode::Up => pos.y -= 1,
                KeyCode::Down => pos.y += 1,
                KeyCode::Left => pos.x -= 1,
                KeyCode::Right => pos.x += 1,

                KeyCode::Char(character) => {
                    let c = if event.modifiers == KeyModifiers::SHIFT {
                        (character as u8).to_ascii_uppercase()
                    } else {
                        (character as u8).to_ascii_lowercase()
                    };

                    if character == 'q' {
                        break 'app_loop;
                    };
                        
                    stdout.write(&[c]);
                }

                _ => {}
            }
        }

        stdout
            .queue(cursor::MoveTo(
                pos.x.try_into().unwrap(),
                pos.y.try_into().unwrap(),
            ))
            .unwrap();
        stdout.flush().unwrap();
    }
}
