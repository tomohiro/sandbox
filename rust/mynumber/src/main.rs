extern crate mynumber;

use mynumber::individual;

fn main() {
    let number = "123456789018";
    match individual::verify(number) {
        Ok(()) => println!("{} is valid", number),
        Err(e) => println!("{} is invalid: {:?}", number, e),
    }
}
