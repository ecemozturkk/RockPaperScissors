import Foundation

enum Choice: String {
    case rock = "ROCK ✊🏼"
    case paper = "PAPER ✋🏼"
    case scissors = "SCISSORS ✌🏼"
    
    static func randomChoice() -> Choice {
        let choices: [Choice] = [.rock, .paper, .scissors]
        let randomIndex = Int.random(in: 0..<choices.count)
        return choices[randomIndex]
    }
}

enum GameResult: String {
    case win = "YOU WIN! 🎉"
    case lose = "YOU LOSE! 🤯"
    case tie = "IT'S A TIE! 🧐"
}

func getUserChoice() -> Choice? {
    print("Enter your choice (R for rock, P for paper, or S for scissors):")
    if let input = readLine()?.uppercased(), let firstCharacter = input.first {
        switch firstCharacter {
        case "R":
            return .rock
        case "P":
            return .paper
        case "S":
            return .scissors
        default:
            return nil
        }
    }
    return nil
}

func determineGameResult(userChoice: Choice, computerChoice: Choice) -> GameResult {
    if userChoice == computerChoice {
        return .tie
    } else if (userChoice == .rock && computerChoice == .scissors) ||
              (userChoice == .paper && computerChoice == .rock) ||
              (userChoice == .scissors && computerChoice == .paper) {
        return .win
    } else {
        return .lose
    }
}

func playGame() {
    if let userChoice = getUserChoice() {
        let computerChoice = Choice.randomChoice()
        print("You chose: \(userChoice.rawValue)")
        print("Computer chose: \(computerChoice.rawValue)")
        
        let result = determineGameResult(userChoice: userChoice, computerChoice: computerChoice)
        print(result.rawValue)
    } else {
        print("Invalid input. Please try again.")
        playGame()
    }
}

playGame()
