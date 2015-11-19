pub enum ValidateError { InvalidMyNumberLength, InvalidType }

pub fn validate(mynumber: &str) -> Result<(), ValidateError> {
    if mynumber.len() != 12 {
        return Err(ValidateError::InvalidMyNumberLength);
    }

    for i in mynumber.chars() {
        if !i.is_numeric() {
            return Err(ValidateError::InvalidType)
        }
    }

    return Ok(());
}
