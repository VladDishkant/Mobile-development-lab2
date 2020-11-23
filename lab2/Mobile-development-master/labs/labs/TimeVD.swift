//
//  TimeVD.swift
//  labs
//
//  Created by vlad on 22.11.2020.
//

import UIKit

class TimeVD {
    var hours: UInt
    var minutes: UInt
    var seconds: UInt
    
    init(hours: UInt = 0, minutes: UInt = 0, seconds: UInt = 0) {
        if hours >= 0 && hours <= 23{
            self.hours = hours
        }else{
            self.hours = 0
        }
        if minutes >= 0 && minutes <= 59{
            self.minutes = minutes
        }else{
            self.minutes = 0
        }
        if seconds >= 0 && seconds <= 59{
            self.seconds = seconds
        }else{
            self.seconds = 0
        }
    }
    
    func getTime() -> String {
        var s: String = ""
        var newHours: UInt = self.hours
        if self.hours >= 0 && self.hours < 12{
            s = "AM"
        }else if self.hours >= 12 && self.hours < 24{
            s = "PM"
        }
        if newHours == 0{
            newHours = 12
        }else if newHours > 12{
            newHours -= 12
        }
        return String(format: "%u:%02u:%02u" , newHours, minutes, seconds) + " \(s)"
    }
    
    func getObjectSum(obj: TimeVD) -> TimeVD {
        var localHours: UInt
        var localMinutes: UInt
        var localSeconds: UInt
        localHours = self.hours + obj.hours
        localMinutes = self.minutes + obj.minutes
        localSeconds = self.seconds + obj.seconds
        if localSeconds >= 60{
            localSeconds -= 60
            localMinutes += 1
        }
        if localMinutes >= 60{
            localMinutes -= 60
            localHours += 1
        }
        if localHours >= 24{
            localHours -= 24
        }
        let resultClass = TimeVD(hours: localHours, minutes: localMinutes, seconds: localSeconds)
        return resultClass
    }
    
    func getObjectSub(obj: TimeVD) -> TimeVD {
        var localHours: Int
        var localMinutes: Int
        var localSeconds: Int
        localHours = Int(self.hours) - Int(obj.hours)
        localMinutes = Int(self.minutes) - Int(obj.minutes)
        localSeconds = Int(self.seconds) - Int(obj.seconds)
        if localSeconds < 0{
            localSeconds += 60
            localMinutes -= 1
        }
        if localMinutes < 0{
            localMinutes += 60
            localHours -= 1
        }
        if localHours < 0{
            localHours += 24
        }
        let resultClass = TimeVD(hours: UInt(localHours), minutes: UInt(localMinutes), seconds: UInt(localSeconds))
        return resultClass
    }
    
    func getObjectsSum(obj1: TimeVD, obj2: TimeVD) -> TimeVD {
        var localHours: UInt
        var localMinutes: UInt
        var localSeconds: UInt
        localHours = obj1.hours + obj2.hours
        localMinutes = obj1.minutes + obj2.minutes
        localSeconds = obj1.seconds + obj2.seconds
        if localSeconds >= 60{
            localSeconds -= 60
            localMinutes += 1
        }
        if localMinutes >= 60{
            localMinutes -= 60
            localHours += 1
        }
        if localHours >= 24{
            localHours -= 24
        }
        let resultClass = TimeVD(hours: localHours, minutes: localMinutes, seconds: localSeconds)
        return resultClass
    }
    
    
    func getObjectsSub(obj1: TimeVD, obj2: TimeVD) -> TimeVD {
        var localHours: Int
        var localMinutes: Int
        var localSeconds: Int
        localHours = Int(obj1.hours) - Int(obj2.hours)
        localMinutes = Int(obj1.minutes) - Int(obj2.minutes)
        localSeconds = Int(obj1.seconds) - Int(obj2.seconds)
        if localSeconds < 0{
            localSeconds += 60
            localMinutes -= 1
        }
        if localMinutes < 0{
            localMinutes += 60
            localHours -= 1
        }
        if localHours < 0{
            localHours += 24
        }
        let resultClass = TimeVD(hours: UInt(localHours), minutes: UInt(localMinutes), seconds: UInt(localSeconds))
        return resultClass
    }
}

var first: TimeVD = TimeVD()
var second: TimeVD = TimeVD(hours: 22, minutes: 55, seconds: 26)

var example1: TimeVD = TimeVD(hours: 14, minutes: 55, seconds: 53)
var example2: TimeVD = TimeVD(hours: 18, minutes: 23, seconds: 14)

print(example1.getTime())
print(example1.getObjectSum(obj: example2).getTime())
print(example1.getObjectSub(obj: example2).getTime())
print(example1.getObjectsSum(obj1: example1, obj2: example2).getTime())
print(example1.getObjectsSub(obj1: example1, obj2: example2).getTime())
