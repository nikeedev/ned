use crossterm::{
    cursor,
    event::{read, Event, KeyCode, KeyEventKind, KeyModifiers},
    terminal, QueueableCommand,
};
use std::io::{stdout, Write, Result};

#[derive(Debug, Clone, Copy)]
struct Vec2 {
    x: i32,
    y: i32,
}

fn main() -> Result<()> {
    let mut stdout = stdout();

    stdout.queue(terminal::Clear(terminal::ClearType::All))?;

    stdout.queue(terminal::SetTitle("ned"))?;
    // some other code ...

    let mut pos = Vec2 { x: 1, y: 1 };

    let mut lines: Vec<Vec2> = vec![Vec2 { x: 1, y: 0}];

    let mut current_line = 0;

    'app_loop: loop {
        let event = read().unwrap();
        

        // if let Event::Key(event) = event {
        //     println!("{:?}", event.code);
        // };
        if let Event::Key(event) = event {
            if event.kind == KeyEventKind::Press {
                match event.code {
                    KeyCode::Up => pos.y -= 1,
                    KeyCode::Down => pos.y += 1,
                    KeyCode::Left => pos.x -= 1,
                    KeyCode::Right => pos.x += 1,

                    KeyCode::Enter => {
                        current_line += 1;
                        lines.push(Vec2 { x: 1, y: current_line });
                        pos.y += 1;
                        pos.x = 1;
                    },

                    
                    KeyCode::Char(character) => {
                        let c = if event.modifiers == KeyModifiers::SHIFT {
                            (character as u8).to_ascii_uppercase()
                        } else {
                            (character as u8).to_ascii_lowercase()
                        };

                        if character == 'q' && event.modifiers == KeyModifiers::CONTROL {
                            break 'app_loop;
                        };

                        let _ = stdout.write(&[c]);
                        pos.x += 1;
                        lines[current_line as usize].x += 1;
                    }

                    _ => {}
                }
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

    dbg!(lines);

    Ok(())
}
