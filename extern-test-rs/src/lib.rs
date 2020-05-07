use std::ffi::*;

#[no_mangle]
pub extern "C" fn hello() -> *mut std::os::raw::c_char {
    let cstring = CString::new("hello".to_owned()).expect("What can we expect?");
    cstring.into_raw()
}

#[no_mangle]
pub unsafe extern "C" fn drop_str(i: *mut std::os::raw::c_char) {
    CString::from_raw(i);
}
