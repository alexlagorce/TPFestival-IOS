import SwiftUI

struct Track: Hashable {
    var trackName: String;
    var artistName: String;
    var collectionName: String;
    var releaseDate: String;
}

//comment changer un element ?
class TrackListViewModel {
    var tracks: [Track];
    @Published var tab: [TrackModelView];
    init(tracks: [Track], tab: [TrackModelView]){
        self.tracks = tracks;
        self.tab = tab;
    }
    func change(name: String, at index: Int){
        for i in self.tab{
            if i.id == index{
                i.liste[index].trackName = name;
            }
        }
    }
}

struct TrackModelView: View {
    public var id: Int = 0
    @State var liste = [
        Track(trackName: "That's Life", artistName: "James Brown", collectionName: "Gettin' Down to It",releaseDate: "1969-05-01T12:00:00Z"), Track(trackName: "Shoot the Moon", artistName: "Norah Jones", collectionName: "Come Away With Me (Deluxe Edition)", releaseDate: "2002-02-26T08:00:00Z"), Track(trackName: "Kozmic Blues", artistName: "Janis Joplin", collectionName: "I Got Dem Ol' Kozmic Blues Again Mama!", releaseDate: "1969-09-11T07:00:00Z"), Track(trackName: "You Found Another Lover (I Lost Another Friend)", artistName: "Ben Harper & Charlie Musselwhite", collectionName: "Get Up! (Deluxe Version)", releaseDate: "2013-01-29T12:00:00Z")
    ]
    
    var body: some View {
        NavigationView{
        
        VStack {
            List {
                ForEach(liste, id: \.self){ liste in
                    NavigationLink(destination: TrackUIView()){
                        HStack{
                            Text(liste.trackName);
                            VStack(alignment: .leading){
                                Text(liste.artistName);
                                Text(liste.collectionName);
                                Text(liste.releaseDate);
                            }
                        }
                    }
                }
                .onDelete{ indexSet in liste.remove(atOffsets: indexSet) } 
                .onMove{ indexSet, index in liste.move(fromOffsets: indexSet, toOffset: index) }
            }
            Text(liste[0].trackName)
            EditButton()
        }
        }
    }
}


