extern crate mynumber;

#[test]
fn validate_with_valid_mynumber_returns_true() {
  let number   = "123456789018";
  let expected = true;
  let actual   = mynumber::validate(number);

  assert_eq!(expected, actual);
}

#[test]
fn validate_with_short_mynumber_returns_false() {
  let number   = "12345";
  let expected = false;
  let actual   = mynumber::validate(number);

  assert_eq!(expected, actual);
}
