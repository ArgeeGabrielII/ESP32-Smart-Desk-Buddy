import AppKit

// Deterministic connection diagram; positions are schematic, not header locations.
final class WiringView: NSView {
    override var isFlipped: Bool { true }
    let ink=NSColor(calibratedRed:0.08,green:0.14,blue:0.22,alpha:1)
    let pale=NSColor(calibratedRed:0.92,green:0.95,blue:0.98,alpha:1)
    let red=NSColor(calibratedRed:0.80,green:0.10,blue:0.12,alpha:1)
    let green=NSColor(calibratedRed:0.04,green:0.46,blue:0.28,alpha:1)
    let orange=NSColor(calibratedRed:0.65,green:0.32,blue:0.01,alpha:1)
    func text(_ value:String,_ x:CGFloat,_ y:CGFloat,_ size:CGFloat=26,_ color:NSColor?=nil,_ bold:Bool=false) {
        (value as NSString).draw(at:NSPoint(x:x,y:y),withAttributes:[.font:bold ? NSFont.boldSystemFont(ofSize:size):NSFont.systemFont(ofSize:size),.foregroundColor:color ?? ink])
    }
    func box(_ x:CGFloat,_ y:CGFloat,_ w:CGFloat,_ h:CGFloat,_ color:NSColor?=nil) {
        (color ?? pale).setFill(); NSBezierPath(roundedRect:NSRect(x:x,y:y,width:w,height:h),xRadius:16,yRadius:16).fill()
    }
    func line(_ x1:CGFloat,_ y1:CGFloat,_ x2:CGFloat,_ y2:CGFloat,_ color:NSColor) {
        let p=NSBezierPath(); p.move(to:NSPoint(x:x1,y:y1)); p.line(to:NSPoint(x:x2,y:y2)); p.lineWidth=7; color.setStroke();p.stroke()
    }
    func dot(_ x:CGFloat,_ y:CGFloat,_ color:NSColor) {
        color.setFill();NSBezierPath(ovalIn:NSRect(x:x-9,y:y-9,width:18,height:18)).fill()
    }
    func ledRow(_ y:CGFloat,_ pin:String,_ name:String,_ color:NSColor) {
        text(pin,85,y-20,30,nil,true)
        line(180,y,400,y,color)
        box(400,y-24,190,48,NSColor(calibratedWhite:0.90,alpha:1))
        text("1 kΩ",460,y-19,27,nil,true)
        line(590,y,890,y,color)
        color.setFill();NSBezierPath(ovalIn:NSRect(x:890,y:y-34,width:68,height:68)).fill()
        line(958,y,1230,y,ink)
        text("GND",1260,y-20,30,nil,true)
        text(name,850,y-100,28,color,true)
        text("anode (+)",700,y+35,23)
        text("cathode (−)",1000,y+35,23)
        dot(180,y,color);dot(1230,y,ink)
    }
    override func draw(_ dirtyRect:NSRect) {
        NSColor.white.setFill();bounds.fill()
        text("ESP32 MINI PARKING ASSISTANT",60,35,44,nil,true)
        text("Connection diagram • Match printed labels; these are not physical pin positions",60,100,25)
        text("1   INFRARED OBSTACLE MODULE",60,165,31,nil,true)
        box(60,225,350,355);box(1030,225,430,355)
        text("ESP32",90,245,31,nil,true);text("OBSTACLE MODULE",1060,245,29,nil,true)
        let rows:[(String,String,CGFloat,NSColor)]=[("3V3","VCC",330,red),("GND","GND",420,ink),("D27","OUT",510,green)]
        for(a,b,y,c) in rows {
            text(a,270,y-20,30,nil,true);text(b,1060,y-20,30,nil,true)
            line(410,y,1030,y,c);dot(410,y,c);dot(1030,y,c)
        }
        text("Photo: sensor facing you, pins down → OUT · GND · VCC (left to right)",60,615,27,nil,true)
        text("3.3 V supply plan: confirm module compatibility; do not substitute 5 V.",60,660,26,orange)
        text("2   TWO LED CIRCUITS — SAME ESP32",60,745,31,nil,true)
        ledRow(960,"D25","GREEN LED",green)
        ledRow(1180,"D26","RED LED",red)
        text("One 1 kΩ resistor per LED. Put LED legs in separate breadboard groups.",60,1295,27,nil,true)
        text("Breadboard + rail = 3.3 V; − rail = common GND. Keep the rails separate.",60,1345,26)
        text("USB unplugged while wiring. Buzzer stays disconnected for this first build.",60,1395,26,nil,true)
        text("Green = clear; red = obstacle. Verify sensor detection with the new sketch.",60,1445,25)
    }
}
let view=WiringView(frame:NSRect(x:0,y:0,width:1520,height:1510))
let rep=view.bitmapImageRepForCachingDisplay(in:view.bounds)!
view.cacheDisplay(in:view.bounds,to:rep)
try rep.representation(using:.png,properties:[:])!.write(to:URL(fileURLWithPath:CommandLine.arguments[1]))
