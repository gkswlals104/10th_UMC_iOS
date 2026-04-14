import SwiftUI

struct MovieDetailView: View {
    
    let title: String
    let englishTitle: String
    let imageName: String
    let description: String
    let age: String
    let openInfo: String
    let genre: String
    let type: String
    let director: String
    let cast: String
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image("king2")
                    .frame(width: 441, height: 248)
                    .padding(.bottom, 16)
                
                VStack(spacing: 0) {
                    Text(title)
                        .font(.pretendard(.bold, size: 24))
                        .foregroundStyle(Color.black)
                        .padding(.bottom, 7)
                    
                    Text(englishTitle)
                        .font(.pretendard(.semi, size: 14))
                        .foregroundStyle(Color.gray03)
                        .padding(.bottom, 9)
                }
                
                .frame(maxWidth: .infinity)
                
                Text(description)
                    .font(.pretendard(.regular, size: 15))
                    .foregroundStyle(Color.gray03)
                    .padding(.horizontal, 32)
                
                HStack(spacing: 20) {
                    
                    VStack(spacing: 6) {
                        Button {
                            selectedTab = 0
                        } label: {
                            Text("상세정보")
                                .foregroundStyle(selectedTab == 0 ? .black : .gray03)
                                .font(.pretendard(.bold, size: 18))
                        }
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(selectedTab == 0 ? .black : .clear)
                    }
                    
                    VStack(spacing: 6) {
                        Button {
                            selectedTab = 1
                        } label: {
                            Text("실관람평")
                                .foregroundStyle(selectedTab == 1 ? .black : .gray03)
                                .font(.pretendard(.bold, size: 18))
                        }
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(selectedTab == 1 ? .black : .clear)
                    }
                }
                .padding(.top, 14)
                .padding(.horizontal, 16)
                
                if selectedTab == 0 {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .top, spacing: 15) {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 44, height: 62)
                                .clipped()
                                .cornerRadius(6)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(age)
                                    .foregroundStyle(.black)
                                    .font(.pretendard(.semi, size: 14))
                                
                                Text(openInfo)
                                    .foregroundStyle(.black)
                                    .font(.pretendard(.semi, size: 14))
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom, 16)
                        
                        Divider()
                            .padding(.bottom, 16)
                        
                        HStack(alignment: .top, spacing: 12) {
                            Text("장르")
                                .foregroundStyle(.gray04)
                                .frame(width: 34, alignment: .leading)
                                .font(.pretendard(.semi, size: 13))
                            
                            Text(genre)
                                .foregroundStyle(.black)
                                .font(.pretendard(.semi, size: 13))
                            
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                        HStack(alignment: .top, spacing: 12) {
                            Text("타입")
                                .foregroundStyle(.gray04)
                                .frame(width: 34, alignment: .leading)
                                .font(.pretendard(.semi, size: 13))
                            
                            Text(type)
                                .foregroundStyle(.black)
                                .font(.pretendard(.semi, size: 13))
                            
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                        HStack(alignment: .top, spacing: 12) {
                            Text("감독")
                                .foregroundStyle(.gray04)
                                .frame(width: 34, alignment: .leading)
                                .font(.pretendard(.semi, size: 13))
                            
                            Text(director)
                                .foregroundStyle(.black)
                                .font(.pretendard(.semi, size: 13))
                            
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                        HStack(alignment: .top, spacing: 12) {
                            Text("출연")
                                .foregroundStyle(.gray04)
                                .frame(width: 34, alignment: .leading)
                                .font(.pretendard(.semi, size: 13))
                            
                            Text(cast)
                                .foregroundStyle(.black)
                                .font(.pretendard(.semi, size: 13))
                            
                            Spacer()
                        }
                    }
                    .padding(16)
                    .padding(.top, 12)
                    .padding(.horizontal, 16)
                } else {
                    VStack {
                        Text("등록된 관람평이 없어요🥲")
                            .foregroundStyle(.black)
                            .font(.pretendard(.semi, size: 18))
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle(title)
        }
    }
}
#Preview {
    HomeView()
}
