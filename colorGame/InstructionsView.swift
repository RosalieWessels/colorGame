//
//  InstructionsView.swift
//  colorGame
//
//  Created by Rosalie on 7/22/20.
//  Copyright © 2020 Rosalie. All rights reserved.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack {
            Text("You have 15 seconds to get the most points possible!")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
            Spacer()
            Text("Click on the button with the color of the text, not the button with the text itself!")
                .font(.system(.title, design: .rounded))
                .multilineTextAlignment(.center)
            Spacer()
            Image("example")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 20.0)
            Text("For example, this would be blue")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
            Spacer()
            Image("example2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 60.0)
            Text("And this would be orange!")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
            Spacer()
        }.padding()
        .navigationBarTitle("Instructions")
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
