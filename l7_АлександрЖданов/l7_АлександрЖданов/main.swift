
import Foundation

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum CinemaErrors: Error {
    case insufficientFounds
    case underage
}

struct FilmOptions {
    var price: Int
    var ageCategory: String
    var film: Film
}

struct Film {
    var name: String
}

class OnlineCinema {
    var selection = [
        "В погоне за счастьем": FilmOptions(price: 12, ageCategory: "general", film: Film(name: "В погоне за счастьем")),
        "Служанка": FilmOptions(price: 9, ageCategory: "18+", film: Film(name: "Служанка")),
        "Побег из шоушенка": FilmOptions(price: 14, ageCategory: "general", film: Film(name: "Побег из шоушенка"))]
    
    let cardBalance = 15
    let userAge = 10
    
    func sale(filmName name: String) throws -> Film {
        guard let movie = selection[name],
              movie.price <= cardBalance else { throw CinemaErrors.insufficientFounds }
        
        if movie.ageCategory != "general", userAge <= 18 { throw CinemaErrors.underage }
        
        let newMovie = movie
        selection[name] = newMovie
        print("Выбранный вами фильм - \(name).")
        
        return newMovie.film
    }
}

let discovery = OnlineCinema()

do {
    try discovery.sale(filmName: "Служанка")
}
catch CinemaErrors.insufficientFounds {
    print("На вашем счету недостаточно средств.")}
catch CinemaErrors.underage {
    print("Вы слишком малы.")
}
