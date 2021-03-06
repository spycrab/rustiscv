use num_traits::{FromPrimitive, Num};

pub fn get_bits<T: Num + FromPrimitive>(input: u64, from: usize, to: usize) -> T {
    assert!(
        from <= to && to < (std::mem::size_of::<T>() * 8),
        "get_bits: Invalid parameters!"
    );

    let mut value: u64 = 0;

    for i in from..=to {
        value |= input & (1 << i);
    }

    value >>= from;

    T::from_u64(value).expect("get_bits: Cast to T failed!")
}

pub fn sign_extend<T: Num + FromPrimitive>(input: usize, length: usize) -> T {
    assert!(
        length < std::mem::size_of::<T>() * 8,
        "sign_extend: Invalid parameters!"
    );

    let mut value = input;
    let sign = (value & (1 << length)) >> length;

    for i in (length + 1)..(std::mem::size_of::<T>() * 8) {
        value |= sign << i;
    }

    T::from_usize(value).expect("sign_extend: Cast to T failed!")
}
