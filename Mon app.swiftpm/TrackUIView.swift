import SwiftUI
import PlaygroundSupport

struct TrackUIView: View{
    public var id: Int = 0
    @State var liste = [
        Track(trackName: "That's Life", artistName: "James Brown", collectionName: "Gettin' Down to It",releaseDate: "1969-05-01T12:00:00Z"), Track(trackName: "Shoot the Moon", artistName: "Norah Jones", collectionName: "Come Away With Me (Deluxe Edition)", releaseDate: "2002-02-26T08:00:00Z"), Track(trackName: "Kozmic Blues", artistName: "Janis Joplin", collectionName: "I Got Dem Ol' Kozmic Blues Again Mama!", releaseDate: "1969-09-11T07:00:00Z"), Track(trackName: "You Found Another Lover (I Lost Another Friend)", artistName: "Ben Harper & Charlie Musselwhite", collectionName: "Get Up! (Deluxe Version)", releaseDate: "2013-01-29T12:00:00Z")
    ]
    
    var body: some View{
        HStack {
            List {
                ForEach(liste, id: \.self){ liste in
                    VStack(alignment: .leading){
                        Text(liste.trackName);
                        Text(liste.artistName)
                            .bold()
                        Text(liste.collectionName);
                    }
                }
                .onDelete{ indexSet in liste.remove(atOffsets: indexSet) } 
                .onMove{ indexSet, index in liste.move(fromOffsets: indexSet, toOffset: index) }
            }
        }
    }
}


