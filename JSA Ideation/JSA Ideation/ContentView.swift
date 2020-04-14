//
//  ContentView.swift
//  JSA Ideation
//
//  Created by Academia on 12/13/19.
//  Copyright © 2019 Cate. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //    @State var selectedView: Int = 0
    var courses: [Course] = [Course(title: "English", instructor: "Mr. Homes", term: 1), Course(title: "Advanced Statistics", instructor: "Mr. Homes", term: 1), Course(title: "History of California", instructor: "Mr. Homes", term: 1), Course(title: "Art and Science", instructor: "Mr. Homes", term: 1), Course(title: "Senior Inquiry", instructor: "Mr. Homes", term: 1), Course(title: "Music and Drama", instructor: "Mr. Homes", term: 1)]
    var greeting = "Good afternoon"
    var user = "Jacob"
    
    var body: some View {
        TabView() {
            /// Tab 1: Classes
            NavigationView {
                VStack(alignment: .leading) {
                    ForEach(courses, id: \.self) { course in
                        NavigationLink(destination: CourseDetail(course: course)) {
                            CourseCell(course: course)
                        }
                    }
                    ZStack {
                        Circle().foregroundColor(Color(UIColor.systemGray)).frame(height: 50)
                        Text("Edit").foregroundColor(Color(UIColor.systemGray4))
                    }
                    Spacer()
                }.navigationBarTitle("\(greeting), \(user)")
            }
            .tabItem {
                Image(systemName: "book.fill")
                Text("Classes")
            }.tag(0)
            
            /// Tab 2: Mail
            Text("Mail")
                .tabItem {
                    Image(systemName: "envelope.fill")
                    Text("Mail")
            }.tag(1)
            
            /// Tab 3: Calendar
            Text("Calendar")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CourseCell: View {
    let course: Course
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Image(systemName: "\(course.title.lowercased().prefix(1)).square")
                Text(course.title).font(.title).foregroundColor(Color(UIColor.darkText))
                Spacer()
                VStack (alignment: .trailing) {
                    Text(course.instructor).foregroundColor(Color(UIColor.systemGray))
                    Text("Trimester \(String(course.term))").foregroundColor(Color(UIColor.systemGray))
                }
            }.padding(10)
            Divider()
        }
    }
}

struct CourseDetail: View {
    let course: Course
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "envelope")
                Text(course.title).font(.largeTitle)
                Spacer()
                VStack (alignment: .trailing) {
                    Text(course.instructor)
                    Text("Trimester \(String(course.term))")
                }
            }.padding(10)
        }
    }
}
