base $080d 

_chrout = $ffd2 

        enum $0022

        x dsb 1
        y dsb 1

        lo dsb 1
        hi dsb 1

        ende

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
        
        ;test new bit modes
        lda #$af
        bit %01010101
        
        ;new addressing modes
        adc ($30)


        rts

print:
        ldx #0
-       lda hello, x
        beq done
        jsr _chrout
        inx
        bne -


bits    db #$ff
hw      db "hello, world",0
