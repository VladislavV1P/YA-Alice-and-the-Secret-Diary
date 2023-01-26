import Foundation

let secondInDay = 86400
let allDay = 18627

var startDate = 0
var endDate = allDay
var middleDate = 0

func readGameConfig() -> Int {
    guard
        let input = readLine()?.split(separator: " ").compactMap({ Int(String($0)) }),
        input.count == 1
    else {
        return 0
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

let dayTimePeriodFormatter = DateFormatter()
dayTimePeriodFormatter.dateFormat = "dd.MM.YYYY"
var selectedDate = ""

func selectDay(day: Int) {
    let date = Date(timeIntervalSince1970: TimeInterval(day * secondInDay))
    selectedDate = dayTimePeriodFormatter.string(from: date)
}

func middleData(start: Int, end: Int) {
    middleDate = (start + end) / 2
    selectDay(day: middleDate)
}

middleData(start: startDate, end: endDate)

func solution() {
    // read game configuration
    let numberOfAttempts = readGameConfig()
    // write your code here
    
    if numberOfAttempts == 1 {
        print(date: selectedDate)
    } else {
        ask(date: "31.12.2020")
        var answer = readGameConfig()
        let middleNumber = answer / 2 + 1
        ask(date: selectedDate)
        answer = readGameConfig()
        
        while startDate != middleDate {
            if answer >= middleNumber {
                endDate = middleDate
            } else {
                startDate = middleDate
            }
            middleData(start: endDate, end: startDate)
            ask(date: selectedDate)
            answer = readGameConfig()
        }
        if answer < middleNumber {
            selectDay(day: endDate)
            print(date: selectedDate)
        } else {
            selectDay(day: startDate)
            print(date: selectedDate)
        }
    }
}

solution()
