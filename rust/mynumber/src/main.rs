extern crate mynumber;

fn main() {
    let number = "123456789018";
    match mynumber::validate(number) {
      Ok(()) => println!("{} is valid", number),
      Err(e) => println!("{} is invalid: {:?}", number, e),
    }
}
