.section .data
msg:
    .ascii "Hello,World!\n"
    len=.-msg

.section .text
.global _start
_start:
    movl    $len, %edx          #第三个参数： len
    movl    $msg, %ecx          #第二个参数： buf
    movl    $1, %ebx            #第一个参数： fd
    movl    $4, %eax            #系统调用号sys_write
    int     $0x80               #调用内核功能

    movl $0, %ebx               #第一个参数： exitcode
    movl $1, %eax               #系统调用sys_exit
    int $0x80                   #调用内核功能
