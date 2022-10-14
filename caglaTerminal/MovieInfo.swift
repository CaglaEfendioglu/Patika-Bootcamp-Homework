

import Foundation

protocol MovieInfoPorotocol {
    func actorName()
    func actorList() -> [Actor]
    func movieList(actor: Actor)
    func movieDetail(actor: Actor)
    func addMovie(actor: Actor, movie: Int)
}

class MovieInfo: MovieInfoPorotocol {
    var movieList: [Movie] = []
    var movieDetay: [Movie] = []
    var addMovie: [Movie]?
    var movieListName = ""
    var movieLisVisionDate = 0
    var movieListScore = 0.0
    var movieItemList: [Movie] = []
    //var itemInfo = ItemInfo()
    
    func getMovie(actor: Actor) -> [Movie] {
        let titanic = Movie(movieName: "titanic", visionDate: 1997, imdbScore: 7.9)
        let shutterIsland = Movie(movieName: "Shutter Island", visionDate: 2010, imdbScore: 8.2)
        let inception = Movie(movieName: "Inception", visionDate: 2010, imdbScore: 8.8)
        let dontLookUp = Movie(movieName: "Don’t Look Up", visionDate: 2021, imdbScore: 7.2)
        
        let forrestGump = Movie(movieName: "Forrest Gump", visionDate: 1994, imdbScore: 8.8)
        let bridgeOfSpies = Movie(movieName: "Bridge of Spies", visionDate: 2015, imdbScore: 7.6)
        let sully = Movie(movieName: "Sully", visionDate: 2016, imdbScore: 7.4)
        let captainPhilips = Movie(movieName: "Captain Philips", visionDate: 2013, imdbScore: 7.8)
        
        let ironMan  = Movie(movieName: "Iron Man", visionDate: 2008, imdbScore: 7.9)
        let sherlockHolmes = Movie(movieName: "Sherlock Holmes", visionDate: 2009, imdbScore: 7.6)
        let theJudge = Movie(movieName: "The Judge", visionDate: 2014, imdbScore: 7.4)
        let theAvengers = Movie(movieName: "The Avengers", visionDate: 2012, imdbScore: 8)
        
        let eternalSunshineOfTheSpotlessMind = Movie(movieName: "Eternal Sunshine of the Spotless Mind", visionDate: 2004, imdbScore: 8.3)
        let theTrumanShow = Movie(movieName: "The Truman Show", visionDate: 1998, imdbScore: 8.2)
        let yesMan = Movie(movieName: "Yes Man", visionDate: 2008, imdbScore: 6.8)
        let liarLiar  = Movie(movieName: "Liar Liar ", visionDate: 1997, imdbScore: 6.9)
        
        let leonardoDiCaprioMovieList = [titanic, shutterIsland, inception, dontLookUp]
        let tomHanksMovieList = [forrestGump, bridgeOfSpies, sully, captainPhilips]
        let robertDowneyMovieList = [ironMan, sherlockHolmes, theJudge, theAvengers]
        let jimCarreyMovieList = [eternalSunshineOfTheSpotlessMind, theTrumanShow, yesMan, liarLiar]
        

        
        switch actor.actorName?.lowercased() {
            case "leonardo dicaprio":
                self.movieItemList = leonardoDiCaprioMovieList
            case "tom hanks":
                self.movieItemList = tomHanksMovieList
            case "robert downey jr.":
                self.movieItemList = robertDowneyMovieList
            case "jim carrey":
                self.movieItemList = jimCarreyMovieList
            default:
                self.movieItemList = []
            }
        
        return movieItemList
    }
    
    func actorName() {
        let actor1 = Actor(actorName: "Leonardo DiCaprio", dateOfBirth: 1974)
        let actor2 = Actor(actorName: "Tom Hanks", dateOfBirth: 1956)
        let actor3 = Actor(actorName: "Robert Downey Jr.", dateOfBirth: 1965)
        let actor4 = Actor(actorName: "Jim Carrey", dateOfBirth: 1962)
        
        let actorListArray = [actor1, actor2, actor3, actor4]
        
        for i in actorListArray {
            print(i.actorName ?? "")
        }
    }
    
    func actorList() -> [Actor] {
        let actor1 = Actor(actorName: "Leonardo DiCaprio", dateOfBirth: 1974)
        let actor2 = Actor(actorName: "Tom Hanks", dateOfBirth: 1956)
        let actor3 = Actor(actorName: "Robert Downey Jr.", dateOfBirth: 1965)
        let actor4 = Actor(actorName: "Jim Carrey", dateOfBirth: 1962)
        
        let actorListArray = [actor1, actor2, actor3, actor4]
        
        return actorListArray
    }
    
    func movieList(actor: Actor) {
        movieList = getMovie(actor: actor)

        for i in movieList {
            guard let name = i.movieName, let visionDate = i.visionDate, let imdbScore = i.imdbScore  else { return}
        
            self.movieListName = name
            self.movieLisVisionDate = visionDate
            self.movieListScore = imdbScore
            
            print("Movi Name: \(movieListName)")
            print("******************")
        }
    }
    
    func movieDetail(actor: Actor) {
        movieDetay =  getMovie(actor: actor)
        guard let actorName = actor.actorName, let actordateOfBirth = actor.dateOfBirth  else { return }
        
        print("Actor Name: \(actorName)")
        print("Actor Date of Birth: \(actordateOfBirth)")
        print("******************")
    
        for i in movieDetay {
            
            guard let name = i.movieName, let visionDate = i.visionDate, let imdbScore = i.imdbScore  else { return}
            
            self.movieListName = name
            self.movieLisVisionDate = visionDate
            self.movieListScore = imdbScore
            
            print("Movie Name: \(name)")
            print("Movie VisionDate: \(visionDate)")
            print("Movie IMDB: \(imdbScore)")
            print("******************")
        }
    }
    
    func addMovie(actor: Actor, movie: Int) {
        self.addMovie = getMovie(actor: actor)
        guard let addMovieTwo = addMovie else { return }
        let addMovieData = addMovieTwo[movie]
        guard let addMovieName = addMovieData.movieName else { return }
        print("\(addMovieName) sepete eklendi")
    }
}

