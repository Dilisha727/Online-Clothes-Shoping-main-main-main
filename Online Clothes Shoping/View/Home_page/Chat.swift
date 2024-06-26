import SwiftUI

struct Chat: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button(action: {
                // Handle search action
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal)
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat(searchText: .constant(""))
    }
}
