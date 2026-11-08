    .section .text.init, "ax", @progbits
    .align 4
    .globl _start
    .type _start, @function

_start:
    .option push
    .option norelax
    la      sp, __stack_top
    .option pop

    call    SnippyFunction

write_tohost:
    li      t5, 1

    .option push
    .option norelax
    la      t4, tohost
    .option pop

    sw      t5, 0(t4)

1:
    j       1b

    .size _start, . - _start


    .section .tohost, "aw", @progbits
    .align 6
    .globl tohost
tohost:
    .word 0

    .align 6
    .globl fromhost
fromhost:
    .word 0
