

import Foundation

print("Oyuncu Film sayfasina hosgeldiniz")

let movieInfo = MovieInfo()
let actorList = movieInfo.actorList()
movieInfo.actorName()


print("Lutfen hangi oyuncunun film bilgilerini gormek istediginizi secin(sayisal olarak 0...3)")


while let movieID = readLine() {
    print("******************")
    if let id = Int(movieID) {
        print("\(actorList[id].actorName ?? "") secildi")
        print("******************")
        movieInfo.movieList(actor: actorList[id])
    }
        print("Film detay sayfasina gitmek ister misin ?(evet - hayir)")
    if let isDetay = readLine() {
        print("******************")
        if isDetay == "evet" {
            if let id = Int(movieID) {
                movieInfo.movieDetail(actor: actorList[id])
            }
            print("Favorilere eklemek ister misiniz ?(evet - hayir)")
            if let isSepet = readLine() {
                print("******************")
                if isSepet == "evet" {
                    print("Kacinci filmi eklemek istersiniz ?(sayi olarak)")
                    let howMovie = readLine()
                    print("******************")
                    if let howMovieInt = Int(howMovie ?? ""), let id = Int(movieID) {
                        movieInfo.addMovie(actor: actorList[id], movie: howMovieInt)
                        print("anasayfaya dondunuz")
                        movieInfo.actorName()
                        print("Lutfen hangi oyuncunun film bilgilerini gormek istediginizi secin(sayisal olarak 0...3)")
                    }
                }else{
                    print("anasayfaya dondunuz")
                    movieInfo.actorName()
                    print("Lutfen hangi oyuncunun film bilgilerini gormek istediginizi secin(sayisal olarak 0...3)")
                    continue
                }
            }
        }else{
            print("anasayfaya dondunuz")
            movieInfo.actorName()
            print("Lutfen hangi oyuncunun film bilgilerini gormek istediginizi secin(sayisal olarak 0...3)")
            continue
        }
    }
}




