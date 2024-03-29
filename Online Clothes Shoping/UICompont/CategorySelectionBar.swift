import SwiftUI

enum Category {
    case women
    case men
    case children
}

struct CategorySelectionBar: View {
    @Binding var selectedCategory: Category
    
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                selectedCategory = .women
            }) {
                Text("Women")
            }
            
            Button(action: {
                selectedCategory = .men
            }) {
                Text("Men")
            }
            
            Button(action: {
                selectedCategory = .children
            }) {
                Text("Children")
            }
        }
        .padding()
    }
}

struct CategorySelectionBar_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectionBar(selectedCategory: .constant(.women))
            .padding(20)
    }
}
