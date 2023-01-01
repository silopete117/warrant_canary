{

    function abi_decode_t_uint8(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint8(value)
    }

    function abi_decode_tuple_t_uint8(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    // string -> string
    function abi_encode_t_string_storage_to_t_string_memory_ptr_fromStack(value, pos) -> ret {
        let slotValue := sload(value)
        let length := extract_byte_array_length(slotValue)
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
        switch and(slotValue, 1)
        case 0 {
            // short byte array
            mstore(pos, and(slotValue, not(0xff)))
            ret := add(pos, 0x20)
        }
        case 1 {
            // long byte array
            let dataPos := array_dataslot_t_string_storage(value)
            let i := 0
            for { } lt(i, length) { i := add(i, 0x20) } {
                mstore(add(pos, i), sload(dataPos))
                dataPos := add(dataPos, 1)
            }
            ret := add(pos, i)
        }
    }

    function abi_encode_t_stringliteral_2c1ec216fd459f07204ba2a8e0bbd10a91b494d96996b830961a640e70ee37c5_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 23)
        store_literal_in_memory_2c1ec216fd459f07204ba2a8e0bbd10a91b494d96996b830961a640e70ee37c5(pos)
        end := add(pos, 32)
    }

    function abi_encode_t_stringliteral_33ddb3bcf29def5df2e778008b233675baaee7ea4df3e71f11657282712906e6_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 49)
        store_literal_in_memory_33ddb3bcf29def5df2e778008b233675baaee7ea4df3e71f11657282712906e6(pos)
        end := add(pos, 64)
    }

    function abi_encode_t_stringliteral_dfeeb76f176a8c54ba8316ddc386a9e70e2a7441efaa588235858e4486a5ecff_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 17)
        store_literal_in_memory_dfeeb76f176a8c54ba8316ddc386a9e70e2a7441efaa588235858e4486a5ecff(pos)
        end := add(pos, 32)
    }

    function abi_encode_t_stringliteral_eb748e62953d514f2b1e66591496fd926cc15f07b90a3be895ff3fcc3c1ca31f_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 22)
        store_literal_in_memory_eb748e62953d514f2b1e66591496fd926cc15f07b90a3be895ff3fcc3c1ca31f(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_bool__to_t_bool__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

    }

    function abi_encode_tuple_t_string_storage__to_t_string_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_string_storage_to_t_string_memory_ptr_fromStack(value0,  tail)

    }

    function abi_encode_tuple_t_stringliteral_2c1ec216fd459f07204ba2a8e0bbd10a91b494d96996b830961a640e70ee37c5__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_2c1ec216fd459f07204ba2a8e0bbd10a91b494d96996b830961a640e70ee37c5_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_tuple_t_stringliteral_33ddb3bcf29def5df2e778008b233675baaee7ea4df3e71f11657282712906e6__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_33ddb3bcf29def5df2e778008b233675baaee7ea4df3e71f11657282712906e6_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_tuple_t_stringliteral_dfeeb76f176a8c54ba8316ddc386a9e70e2a7441efaa588235858e4486a5ecff__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_dfeeb76f176a8c54ba8316ddc386a9e70e2a7441efaa588235858e4486a5ecff_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_tuple_t_stringliteral_eb748e62953d514f2b1e66591496fd926cc15f07b90a3be895ff3fcc3c1ca31f__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_eb748e62953d514f2b1e66591496fd926cc15f07b90a3be895ff3fcc3c1ca31f_to_t_string_memory_ptr_fromStack( tail)

    }

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function array_dataslot_t_string_storage(ptr) -> data {
        data := ptr

        mstore(0, ptr)
        data := keccak256(0, 0x20)

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function cleanup_t_uint8(value) -> cleaned {
        cleaned := and(value, 0xff)
    }

    function extract_byte_array_length(data) -> length {
        length := div(data, 2)
        let outOfPlaceEncoding := and(data, 1)
        if iszero(outOfPlaceEncoding) {
            length := and(length, 0x7f)
        }

        if eq(outOfPlaceEncoding, lt(length, 32)) {
            panic_error_0x22()
        }
    }

    function panic_error_0x22() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x22)
        revert(0, 0x24)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function store_literal_in_memory_2c1ec216fd459f07204ba2a8e0bbd10a91b494d96996b830961a640e70ee37c5(memPtr) {

        mstore(add(memPtr, 0), "Canary is already alive")

    }

    function store_literal_in_memory_33ddb3bcf29def5df2e778008b233675baaee7ea4df3e71f11657282712906e6(memPtr) {

        mstore(add(memPtr, 0), "Only the contract deployer can c")

        mstore(add(memPtr, 32), "all this function")

    }

    function store_literal_in_memory_dfeeb76f176a8c54ba8316ddc386a9e70e2a7441efaa588235858e4486a5ecff(memPtr) {

        mstore(add(memPtr, 0), "Invalid canary id")

    }

    function store_literal_in_memory_eb748e62953d514f2b1e66591496fd926cc15f07b90a3be895ff3fcc3c1ca31f(memPtr) {

        mstore(add(memPtr, 0), "Canary is already dead")

    }

    function validator_revert_t_uint8(value) {
        if iszero(eq(value, cleanup_t_uint8(value))) { revert(0, 0) }
    }

}
