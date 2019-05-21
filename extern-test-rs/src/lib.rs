#[no_mangle]
pub extern "C" fn hello() -> *const isize {
    Box::leak(Box::new(201))
}

#[no_mangle]
pub unsafe extern "C" fn drop_isize(i: *mut isize) {
    Box::from_raw(i);
}
