const Error = error{ Foo, Bar };

const ErrorUnionType = Error!u32;
//    ^^^^^^^^^^^^^^ (type)()

const InvalidErrorUnionTypeUnwrap = ErrorUnionType catch |err| err;
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^ (unknown)()
//                                                        ^^^ (unknown)()

const UnknownError = E!u32;
//    ^^^^^^^^^^^^ (type)()

const unknown_error: UnknownError = undefined;
//    ^^^^^^^^^^^^^ ((unknown type)!u32)()

const UnknownPayload = Error!T;
//    ^^^^^^^^^^^^^^ (type)()

const unknown_payload: UnknownPayload = undefined;
//    ^^^^^^^^^^^^^^^ (error{Foo,Bar}!(unknown type))()

const UnknownErrorPayload = E!T;
//    ^^^^^^^^^^^^^^^^^^^ (unknown)()

// since this is completely unresolved use `@as` so it isn't accidentally resolved as `@TypeOf(undefined)`
const unknown_error_payload = @as(UnknownErrorPayload, undefined);
//    ^^^^^^^^^^^^^^^^^^^^^ (unknown)()
