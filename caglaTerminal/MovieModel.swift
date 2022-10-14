
import Foundation

class Movie {
    let movieName: String?
    let visionDate: Int?
    let imdbScore: Double?
    
    init(movieName: String, visionDate: Int, imdbScore: Double) {
        self.movieName = movieName
        self.visionDate = visionDate
        self.imdbScore = imdbScore
    }
}
