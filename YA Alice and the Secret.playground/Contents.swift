import Foundation

func readGameConfig() -> Int {
    guard
        let input = readLine()?.split(separator: " ").compactMap({ Int(String($0)) }),
        input.count == 1
    else {
        fatalError()
    }
    return input[0]

}

func ask(date: String) {
    print("? \(date)")
    fflush(stdout)
}

func print(date: String) {
    print("! \(date)")
    fflush(stdout)
}

let start = "1970-01-01T10:44:00+0000"
let end = "2020-12-31T10:44:00+0000"
let dateFormatter = ISO8601DateFormatter()
let dateStart = dateFormatter.date(from:start)!
let dateEnd = dateFormatter.date(from:end)!


let timeIntervalStart = dateStart.timeIntervalSince1970
let timeIntervalEnd = dateEnd.timeIntervalSince1970
var dateStarInt = Int(timeIntervalStart)
var dateEndInt = Int(timeIntervalEnd)


func solution() {
    // read game configuration
    let _ = readGameConfig()

    // write your code here
    
    
    ask(date: "31.12.2020")
    let answer = readGameConfig()
    let memorableDateNumber = answer / 2 + 1
    
    let dayTimePeriodFormatter = DateFormatter()
    dayTimePeriodFormatter.dateFormat = "dd.MM.YYYY"
    var selectedDate = ""
    var total = 0
    
    while dateStarInt != dateEndInt && total != 18 {
        let middleDate = (dateStarInt + dateEndInt) / 2
        let date = Date(timeIntervalSince1970: TimeInterval(middleDate))
        
        selectedDate = dayTimePeriodFormatter.string(from: date)
        ask(date: selectedDate)
        let answerSys = readGameConfig()
        
        if  answerSys >= memorableDateNumber {
            dateEndInt = middleDate
        } else {
            dateEndInt = middleDate
        }
        total += 1
    }
    print(date: selectedDate)
}

solution()

