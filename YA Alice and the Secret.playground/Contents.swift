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

func solution() {
    // read game configuration
    let _ = readGameConfig()

    // write your code here
}

solution()

