base $080d 

_chrout = $ffd2 

        enum $0022

        x       dsb 1
        y       dsb 1
        lo      dsb 1
        hi      dsb 1
        bits    dsb 1

        ende

macro print_str str
        lda #<str
        sta lo
        lda #>str
        sta hi
        jsr print
endm

start:
        ;test new instructions
        lda #$0a
        inc a
        dec a
        ina
        dea

        phx
        plx
        phy
        ply

        sta x
        stz x

        lda #$0f
        sta x
        lda #$10
        trb x

        lda #$0f
        sta x
        lda #$0a
        tsb x 
        
        ;test new bit modes
        lda #$af
        bit %01010101
        
        ;new addressing modes
        ;these instructions now support zero page indirection
        lda #<y
        sta x
        lda #$07
        adc (x)
        and (x)
        cmp (x)
        eor (x)
        lda (x)
        ora (x)
        sbc (x)
        sta (x)

        
        lda #$00
        sta bits

        bbs0 bits, quit
        bbs1 bits, quit
        bbs2 bits, quit
        bbs3 bits, quit
        bbs4 bits, quit
        bbs5 bits, quit
        bbs6 bits, quit
        bbs7 bits, quit

        lda #$ff
        sta bits

        bbr0 bits, quit
        bbr1 bits, quit
        bbr2 bits, quit
        bbr3 bits, quit
        bbr4 bits, quit
        bbr5 bits, quit
        bbr6 bits, quit
        bbr7 bits, quit


        smb0 bits
        smb1 bits
        smb2 bits
        smb3 bits
        smb4 bits
        smb5 bits
        smb6 bits
        smb7 bits

        rmb0 bits
        rmb1 bits
        rmb2 bits
        rmb3 bits
        rmb4 bits
        rmb5 bits
        rmb6 bits
        rmb7 bits
quit:
        rts


print:
        pha
        ldy #0
-       lda (lo), y ;fix bug, assembler accepts lda (zp), x
        beq +
        jsr _chrout
        iny
        bne -
+       pla
        rts

