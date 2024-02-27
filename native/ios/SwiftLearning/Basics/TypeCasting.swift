/*
 1. TypeCasting implemented in swift using 'is' and 'as' operator
 2. TypeCheck operator 'is' return true or false
 3. Casting does not change the instance, instead it changes the type of that variable.
 
 4. Any : Instance of any type clas, function, structure
 5. AnyObject : Instance of any class type.
 */

import Foundation

class TypeCasting{
    
    class MediaItem {
        var name: String
        init(name: String) {
            self.name = name
        }
    }
    
    class Movie: MediaItem {
        var director: String
        init(name: String, director: String) {
            self.director = director
            super.init(name: name)
        }
    }
    
    class Song: MediaItem {
        var artist: String
        init(name: String, artist: String) {
            self.artist = artist
            super.init(name: name)
        }
    }
    
    let library = [
        Movie(name: "Casablanca", director: "Michael Curtiz"),
        Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
        Movie(name: "Citizen Kane", director: "Orson Welles"),
        Song(name: "The One And Only", artist: "Chesney Hawkes"),
        Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
    ]
    
    private func checkTypeCastCount (){
        var songCounter = 0;
        var movieCounter = 0;
        
        for mediaItem in library
        {
            // 'is' opearator returning true or false
            if mediaItem is Movie
            {
                movieCounter += 1;
            }
            else if mediaItem is Song
            {
                songCounter += 1;
            }
        }
        
        print("Movie Counter \(movieCounter)");
        print("Song Counter \(songCounter)");
    }
    
    private func checkDowncasting (){
        // 'as' operator is used for downcasting.
        // 'as?' if not sure the downcast will be successfull
        // 'as!' sure if downcast will be successfull.
        
        
        let movie : MediaItem = Movie(name: "Casablanca", director: "Michael Curtiz");
        let song : MediaItem = Song(name: "Blue Suede Shoes", artist: "Elvis Presley");
        print("Movie \(movie)");
        
        let downcastMovie : Movie = movie as! Movie;
        print("downcastMovie \(downcastMovie)");

//        downcastMovie = song as! Movie; // Run time crash because object was of type song and caster to movie
//        print("downcastMovie \(downcastMovie)");
        
        let songObj:MediaItem? = song as? Movie; // here downcasting will fail but application will not crash.
        print("Optional downcasting of Song \(String(describing: songObj))")

    }
    

    func checkDownCastingForStructures () {
        let obj : Int = 0;
        
//        let s = obj as! String; // Build Time error, but i am insane 🤪
//        print("DownCast to String \(s)")
    }
    
    
    
    func checkAnyType () {
        var things = [Any]()
        
        things.append(0)
        things.append(10.2)
        things.append("String")
        things.append(library)

        for thing in things {
            if thing is Int
            {
                print("Thing \(thing) is Integer Type")
            }
            else if thing is String
            {
                print("Thing \(thing) is String Type")
            }
        }
    }
    
    func debugAll (){
        checkTypeCastCount();
        
        checkDowncasting();
        
        checkDownCastingForStructures();
        
        checkAnyType();
    }
}
