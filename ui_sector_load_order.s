; UI Sector Load Order
; Michaelangel007
; Copyleft {c} 2025
; Merlin32 . -v ui_sector_load_order.s

MON_A1L = $3C
MON_A1H = $3D
PRA1   = $FD92  ; Print MON.A1H, A1L -> Y,X
PRHEX  = $FDE3
MONZ   = $FF69

    ORG $0800   ; Boot Sector
    DB $10      ; 16 sectors
Boot
    STA $C0E8   ; Turn drive off Slot 6
    LDX #8
    LDY #0
    STY MON_A1L
    STX MON_A1H
Loop
    JSR PRA1    ; Print ####-
    LDA (MON_A1L),Y
    JSR PRHEX
    INC MON_A1H ; Next Page
    LDA MON_A1H
    CMP #$18
    BNE Loop
    JMP MONZ
