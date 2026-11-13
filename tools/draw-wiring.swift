import AppKit

final class WiringView: NSView {
    override var isFlipped: Bool { true }
    func text(_ value: String, _ x: CGFloat, _ y: CGFloat, _ size: CGFloat = 26, _ color: NSColor = .black, _ bold: Bool = false) {
        (value as NSString).draw(at: NSPoint(x:x,y:y), withAttributes:[.font: bold ? NSFont.boldSystemFont(ofSize:size) : NSFont.systemFont(ofSize:size), .foregroundColor:color])
    }
    func box(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, _ color: NSColor) {
        color.setFill(); NSBezierPath(roundedRect:NSRect(x:x,y:y,width:w,height:h),xRadius:20,yRadius:20).fill()
    }
    func line(_ x1: CGFloat, _ y1: CGFloat, _ x2: CGFloat, _ y2: CGFloat, _ color: NSColor, _ dashed: Bool = false) {
        let p=NSBezierPath(); p.move(to:NSPoint(x:x1,y:y1)); p.line(to:NSPoint(x:x2,y:y2)); p.lineWidth=8
        if dashed { var d:[CGFloat]=[14,10]; p.setLineDash(&d,count:2,phase:0) }
        color.setStroke(); p.stroke()
    }
    func dot(_ x: CGFloat, _ y: CGFloat, _ color: NSColor) {
        color.setFill(); NSBezierPath(ovalIn:NSRect(x:x-10,y:y-10,width:20,height:20)).fill()
    }
    override func draw(_ dirtyRect: NSRect) {
        NSColor.white.setFill(); bounds.fill()
        let ink=NSColor(calibratedRed:0.08,green:0.14,blue:0.22,alpha:1)
        let pale=NSColor(calibratedRed:0.91,green:0.95,blue:0.98,alpha:1)
        let red=NSColor(calibratedRed:0.80,green:0.10,blue:0.12,alpha:1)
        let green=NSColor(calibratedRed:0.05,green:0.48,blue:0.29,alpha:1)
        let yellow=NSColor(calibratedRed:0.72,green:0.48,blue:0.02,alpha:1)
        let orange=NSColor(calibratedRed:0.78,green:0.32,blue:0.02,alpha:1)
        text("ESP32 SMART DESK BUDDY",60,35,46,ink,true)
        text("Wiring connections • Follow printed labels, not pin positions in this drawing",60,100,25,ink)
        text("1   OLED — front pin order: VCC · GND · SCL · SDA",60,165,31,ink,true)
        box(60,225,360,425,pale); box(1030,225,430,425,pale)
        text("ESP32",90,245,32,ink,true); text("4-PIN I2C OLED",1060,245,30,ink,true)
        let oled:[(String,String,CGFloat,NSColor)]=[("3V3","VCC",330,red),("GND","GND",415,ink),("D22","SCL",500,yellow),("D21","SDA",585,green)]
        for (a,b,y,c) in oled {
            text(a,285,y-20,30,ink,true); text(b,1060,y-20,30,ink,true)
            line(420,y,1030,y,c); dot(420,y,c); dot(1030,y,c)
        }
        text("2   DHT11 — sensor facing you, pins pointing down: S · center · −",60,710,30,ink,true)
        box(60,775,360,365,pale); box(1030,775,430,365,pale)
        text("SAME ESP32",90,795,30,ink,true); text("DHT11 MODULE",1060,795,30,ink,true)
        text("D4",285,865,30,ink,true); text("S / DATA",1060,865,30,ink,true)
        line(420,885,1030,885,green); dot(420,885,green); dot(1030,885,green)
        text("GND",285,960,30,ink,true); text("− / GND",1060,960,30,ink,true)
        line(420,980,1030,980,ink); dot(420,980,ink); dot(1030,980,ink)
        text("Center",1060,1055,28,ink,true); dot(1030,1075,orange)
        line(860,1075,1010,1075,orange,true)
        text("LEAVE UNCONNECTED",445,1048,26,orange,true)
        text("Confirm center pin is VCC first",445,1083,24,orange)
        text("Share 3V3 using the breadboard + rail; share GND using the − rail.",60,1190,27,ink)
        text("Keep USB unplugged while wiring. Confirm modules support 3.3 V.",60,1235,27,ink,true)
        text("OLED controller and module voltage ratings are not confirmed from the photos.",60,1285,23,ink)
    }
}
let output=CommandLine.arguments[1]
let view=WiringView(frame:NSRect(x:0,y:0,width:1520,height:1350))
let rep=view.bitmapImageRepForCachingDisplay(in:view.bounds)!
view.cacheDisplay(in:view.bounds,to:rep)
try rep.representation(using:.png,properties:[:])!.write(to:URL(fileURLWithPath:output))
