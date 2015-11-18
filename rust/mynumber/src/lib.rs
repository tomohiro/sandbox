pub fn validate(mynumber: &str) -> bool {
  let numbers = mynumber.as_bytes();
  if numbers.len() != 12 {
    return false;
  }
  return true;
}
