//Maybe there are still mistakes...     By zty199
DefinitionBlock ("", "SSDT", 2, "ACDT", "FANS", 0)
{
    External (_SB_.PCI0.LPCB.EC.RTMP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC.RPM1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC.RPM2, FieldUnitObj)
    Scope(\)
    {
        Device (FANS)
        {
            Name (_HID, EisaId ("APP0111"))  // _HID: Hardware ID
            Name (_CID, "monitor")  // _CID: Compatible ID
            
            Method (TAMB, 0, NotSerialized)
            {
                Local0 = \_SB.PCI0.LPCB.EC.RTMP
                Return (Local0)
            }
            //This method is intended to get information about temperature,
            //But whether it works or not depends on your EC name in your DSDT (EC0 or EC),
            //So if you don't want to use it, you can just delete this method.
            
            Method (FAN0, 1, NotSerialized)
            {
                Local0 = \_SB.PCI0.LPCB.EC.RPM1
                Local1 = \_SB.PCI0.LPCB.EC.RPM2
                Local1 <<= 0x08
                Local0 |= Local1
                Return (Local0)
            }
            
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}