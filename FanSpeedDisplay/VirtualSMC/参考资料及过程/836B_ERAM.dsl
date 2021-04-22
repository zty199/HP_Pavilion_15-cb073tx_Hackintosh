OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
Field (ERAM, ByteAcc, NoLock, Preserve)
{
    SMPR,   8,          // 00H
    SMST,   8,          // 01H
    SMAD,   8,          // 02H
    SMCM,   8,          // 03H
    SMD0,   256,        // 04H
    BCNT,   8,          // 24H
    SMAA,   8,          // 25H
    Offset (0x40), 
    SW2S,   1,          // 40H
        ,   2, 
    ACCC,   1, 
    TRPM,   1, 
    Offset (0x41), 
    W7OS,   1,          // 41H
    QWOS,   1, 
        ,   1, 
    SUSE,   1, 
    RFLG,   1, 
        ,   1, 
        ,   1, 
    Offset (0x42), 
        ,   5,          // 42H
    UBOS,   1, 
    Offset (0x43), 
        ,   1,          // 43H
        ,   1, 
    ACPS,   1, 
    ACKY,   1, 
    GFXT,   1, 
        ,   1, 
        ,   1, 
    Offset (0x44), 
        ,   7,          // 44H
    DSMB,   1, 
    GMSE,   1,          // 45H
        ,   1, 
    QUAD,   1, 
    Offset (0x46), 
    Offset (0x47), 
    ADC4,   8,          // 47H
    ADC5,   8,          // 48H
    Offset (0x4C), 
    STRM,   8,          // 4CH
    Offset (0x4E), 
    LIDE,   1,          // 4EH
    Offset (0x50), 
        ,   5,          // 50H
    DPTL,   1, 
        ,   1, 
    DPTE,   1, 
    Offset (0x52), 
    ECLS,   1,          // 52H
    Offset (0x55), 
    EC45,   8,          // 55H
    Offset (0x58), 
    RTMP,   8,          // 58H
    ADC6,   8,          // 59H
    Offset (0x5E), 
    TMIC,   8,          // 5EH
    Offset (0x61), 
    SHPM,   8,          // 61H
    ECTH,   8,          // 62H
    ECTL,   8,          // 63H
    Offset (0x67), 
    LDDG,   1,          // 67H
        ,   1, 
    GC6R,   1, 
    IGC6,   1, 
    Offset (0x68), 
        ,   3,          // 68H
    PLGS,   1, 
    Offset (0x69), 
        ,   6,          // 69H
    BTVD,   1, 
    Offset (0x6C), 
    GWKR,   8,          // 6CH
    Offset (0x70), 
    BADC,   16,         // 70H
    BFCC,   16,         // 72H
    BVLB,   8,          // 74H
    BVHB,   8,          // 75H
    BDVO,   8,          // 76H
    Offset (0x7F), 
    ECTB,   1,          // 7FH
    Offset (0x82), 
    MBST,   8,          // 82H
    MCUR,   16,         // 83H
    MBRM,   16,         // 85H
    MBCV,   16,         // 87H
    VGAV,   8,          // 89H
    FGM2,   8,          // 8AH
    FGM3,   8,          // 8BH
    Offset (0x8D), 
        ,   5,          // 8DH
    MBFC,   1, 
    Offset (0x92), 
    Offset (0x93), 
    Offset (0x94), 
    GSSU,   1,          // 94H
    GSMS,   1, 
    Offset (0x95), 
    MMST,   4,          // 95H
    DMST,   4, 
    Offset (0xA0), 
    QBHK,   8,          // A0H
    Offset (0xA2), 
    QBBB,   8,          // A2H
    Offset (0xA4), 
    MBTS,   1,          // A4H
    MBTF,   1, 
        ,   4, 
    AD47,   1, 
    BACR,   1, 
    MBTC,   1,          // A5H
        ,   2, 
    MBNH,   1, 
    Offset (0xA6), 
    MBDC,   8,          // A6H
    Offset (0xA8), 
    EWDT,   1,          // A8H
    CWDT,   1, 
    LWDT,   1, 
    AWDT,   1, 
    Offset (0xAA), 
        ,   1,          // AAH
    SMSZ,   1, 
        ,   5, 
    RCDS,   1, 
    Offset (0xAD), 
    SADP,   8,          // ADH
    Offset (0xB2), 
    RPM1,   8,          // B2H
    RPM2,   8,          // B3H
    Offset (0xB7), 
    Offset (0xB8), 
    Offset (0xBA), 
    Offset (0xBB), 
    Offset (0xBC), 
    Offset (0xC1), 
    DPPC,   8,          // C1H
    Offset (0xC8), 
        ,   1,          // C8H
    CVTS,   1, 
    Offset (0xC9), 
    TPVN,   8,          // C9H
    Offset (0xCE), 
    NVDX,   8,          // CEH
    ECDX,   8,          // CFH
    EBPL,   1,          // D0H
    Offset (0xD2), 
        ,   7,          // D2H
    DLYE,   1, 
    Offset (0xD4), 
    PSHD,   8,          // D4H
    PSLD,   8,          // D5H
    DBPL,   8,          // D6H
    STSP,   8,          // D7H
    Offset (0xDA), 
    PSIN,   8,          // DAH
    PSKB,   1,          // DBH
    PSTP,   1, 
        ,   1, 
    PWOL,   1, 
    RTCE,   1, 
    Offset (0xE0), 
    DLYT,   8,          // E0H
    DLY2,   8,          // E1H
    Offset (0xE5), 
    GP12,   8,          // E5H
    SFHK,   8,          // E6H
    Offset (0xE9), 
    DTMT,   8,          // E9H
    PL12,   8,          // EAH
    ETMT,   8,          // EBH
    Offset (0xF2), 
    ZPOD,   1,          // F2H
        ,   4, 
    WLPW,   1, 
    WLPS,   1, 
    ENPA,   1, 
    Offset (0xF4), 
    SFAN,   8,          // F4H
    Offset (0xF8), 
    BAAE,   1,          // F8H
    S3WA,   1, 
    BNAC,   1, 
        ,   1, 
    EFS3,   1, 
    S3WK,   1, 
    RSAL,   1
}
