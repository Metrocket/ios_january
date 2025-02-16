//
//  ContentView.swift
//  January
//
//  Created by Evan Metrock on 1/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    var body: some View {
        NavigationView {
                    VStack {
                        
                        if selectedImage != nil {
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 300, height: 300)
                        } else {
                            Image(systemName: "snow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 300, height: 300)
                        }
                        
                        Button("Camera") {
                            self.sourceType = .camera
                            self.isImagePickerDisplay.toggle()
                        }.padding()
                        
                        Button("photo") {
                            self.sourceType = .photoLibrary
                            self.isImagePickerDisplay.toggle()
                        }.padding()
                    }
                    .navigationBarTitle("Demo")
                    .sheet(isPresented: self.$isImagePickerDisplay) {
                        ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                    }
                    
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
