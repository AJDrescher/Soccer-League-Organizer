// First we initialize an empty array of players(of type dictionary)
var players: [[String: String]] = []

// Now let's create our players and add them to the players collection
// instead of adding each player manually, we'll create a func that adds them easier and quicker

func addPlayer(name: String, height: String, exp: Bool, parents: String) {
    var tempPlayer = ["name": name, "height": height, "parents": parents]
    if exp == true {
        tempPlayer.updateValue("yes", forKey: "exp")
    } else {
        tempPlayer.updateValue("no", forKey: "exp")
    }
    players.append(tempPlayer)
}

// for simplicity

let yes = true
let no = false

addPlayer(name: "Joe Smith", height: "42", exp: yes, parents: "Jim and Jan Smith")
addPlayer(name: "Jill Tanner", height: "36", exp: yes, parents: "Clara Tanner")
addPlayer(name: "Bill Bon", height: "43", exp: yes, parents: "Sara and Jenny Bon")
addPlayer(name: "Eva Gordon", height: "45", exp: no, parents: "Wendy and Mike Gordon")
addPlayer(name: "Matt Gill", height: "40", exp: no, parents: "Charles and Sylvia Gill")
addPlayer(name: "Kimmy Stein", height: "41", exp: no, parents: "Bill and Hillary Stein")
addPlayer(name: "Sammy Adams", height: "45", exp: no, parents: "Jeff Adams")
addPlayer(name: "Karl Saygan", height: "42", exp: yes, parents: "Heather Bledsoe")
addPlayer(name: "Suzane Greenberg", height: "44", exp: yes, parents: "Henrietta Dumas")
addPlayer(name: "Sal Dali", height: "41", exp: no, parents: "Gala Dali")
addPlayer(name: "Joe Kavalier", height: "39", exp: no, parents: "Sam and Elaine Kavalier")
addPlayer(name: "Ben Finkelstein", height: "44", exp: no, parents: "Aaron and Jill Finkelstein")
addPlayer(name: "Diego Soto", height: "41", exp: yes, parents: "Robin anf Sarika Soto")
addPlayer(name: "Chloe Alaska", height: "47", exp: no, parents: "David and Jamie Alaska")
addPlayer(name: "Arnold Williams", height: "43", exp: no, parents: "Claire Willis")
addPlayer(name: "Phillip Helm", height: "44", exp: yes, parents: "Thomas Helm and Eva Jones")
addPlayer(name: "Les Clay", height: "42", exp: yes, parents: "Wyonna Brown")
addPlayer(name: "Herschel Krustofski", height: "45", exp: yes, parents: "Hyman and Rachel Krustofski")

// now we'll split them up based on exp and put them in two diffetent arrays
var expPlayers: [[String: String]] = []
var noExpPlayers: [[String: String]] = []

for player in players {
    if player["exp"] == "yes" {
        expPlayers.append(player)
    } else {
        noExpPlayers.append(player)
    }
}

// now we have them separated out
// next we sort based on height ( and check results )

expPlayers.sort(by: { $0["height"]! < $1["height"]! })
noExpPlayers.sort(by: {$0["height"]! < $1["height"]!})

// uncomment code to check heights are ordered
/*

for player in expPlayers {
    print(player["name"]! + "'s height: " + player["height"]!)
}
for player in noExpPlayers {
    print(player["name"]! + "'s height: " + player["height"]!)
}

 */
// now lets make the three teams and add players accordingly
// we will also add a team property to each player dictionary and practice date and time

var teamSharks: [[String: String]] = []
var teamDragons: [[String: String]] = []
var teamRaptors: [[String: String]] = []

var ourLeague = [teamRaptors, teamDragons, teamSharks]
let numberOfTeams = ourLeague.count

for i in 0...expPlayers.count - 1 {
    if i % numberOfTeams == 0 {
        var newPlayer = expPlayers[i]
        newPlayer.updateValue("Dragons", forKey: "team")
        newPlayer.updateValue("March 17th, 1pm", forKey: "practicetime")
        teamDragons.append(newPlayer)
    } else if i % numberOfTeams == 1 {
        var newPlayer = expPlayers[i]
        newPlayer.updateValue("Sharks", forKey: "team")
        newPlayer.updateValue("March 17th, 3pm", forKey: "practicetime")
        teamSharks.append(newPlayer)
    } else {
        var newPlayer = expPlayers[i]
        newPlayer.updateValue("Raptors", forKey: "team")
        newPlayer.updateValue("March 18th, 1pm", forKey: "practicetime")
        teamRaptors.append(newPlayer)
    }
}

for i in 0...noExpPlayers.count - 1 {
    if i % numberOfTeams == 1 {
        var newPlayer = expPlayers[i]
        newPlayer.updateValue("Sharks", forKey: "team")
        newPlayer.updateValue("March 17th, 3pm", forKey: "practicetime")
        teamSharks.append(newPlayer)
    } else if i % numberOfTeams == 0 {
        var newPlayer = expPlayers[i]
        newPlayer.updateValue("Raptors", forKey: "team")
        newPlayer.updateValue("March 18th, 1pm", forKey: "practicetime")
        teamRaptors.append(newPlayer)
    } else {
        var newPlayer = expPlayers[i]
        newPlayer.updateValue("Dragons", forKey: "team")
        newPlayer.updateValue("March 17th, 1pm", forKey: "practicetime")
        teamDragons.append(newPlayer)
    }
}

ourLeague = [teamSharks, teamDragons, teamRaptors]


// now lets check average heights

func getAverageHeightOf(team: [[String: String]]) -> Double {
    var totalHeight = 0.0
    for player in team {
        totalHeight += Double(player["height"]!)!
    }
    return totalHeight / Double(team.count)
}

// Team Letters Creation

/*
 Letter Format
 Dear XXX, your childs name is XXX and their team is XXX. This is their practice date and time: XXX
 
 
 */



func createTeamLettersFor (league: [[[String: String]]]) -> [String] {
    var letters: [String] = []
    for team in 0...league.count - 1 {
        var teamLetters: [String] = []
        for player in 0...league[team].count - 1{
            let letter = "Dear \(league[team][player]["parents"]!) , your childs name is \(league[team][player]["name"]!) and their team is \(league[team][player]["team"]!). This is their practice date and time: \(league[team][player]["practicetime"]!)! "
            teamLetters.append(letter)
        }
        letters += teamLetters
    }
    return letters
}

// printing the letters

let ourLeagueLetters = createTeamLettersFor(league: ourLeague)
for letter in ourLeagueLetters {
    print(letter)
}

// all letters formatted in one String variable "letters", array of letters can be found above, stored in "ourLeagueLetters"
var letters = ""

for piece in ourLeagueLetters {
    letters += piece
}
print(letters)


