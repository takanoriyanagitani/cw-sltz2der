(module
  (type (;0;) (func (param i32) (result i32)))
  (memory (;0;) 16)
  (export "memory" (memory 0))
  (export "sltz2der" (func 0))
  (func (;0;) (type 0) (param i32) (result i32)
    i32.const 32
    i32.const 0
    local.get 0
    i32.const 127
    i32.and
    local.tee 0
    i32.const 65
    i32.sub
    i32.const 255
    i32.and
    i32.const 26
    i32.lt_u
    select
    local.get 0
    i32.or
    local.tee 0
    i32.const 32
    i32.add
    i32.const 0
    local.get 0
    i32.const 97
    i32.sub
    i32.const 255
    i32.and
    i32.const 26
    i32.lt_u
    select
    i32.const 8
    i32.shl
    i32.const 32768
    i32.or
  )
)
