# SwiftUITest
내배캠 SwiftUI 특강 과제

## 과제 의도
- 아래와 같이 텍스트 VStack의 높이가 이미지를 넘어가지 않는다면 top alignment, 이미지를 넘어간다면 center alignment를 맞추는 뷰를 구현하기

| top | center |
| -- | -- |
|<img width="139" alt="Screenshot 2025-01-09 at 8 24 06 PM" src="https://github.com/user-attachments/assets/9ff8657d-a466-4c88-8844-5feb423a61f0" />|<img width="141" alt="Screenshot 2025-01-09 at 8 24 42 PM" src="https://github.com/user-attachments/assets/4967a975-47f2-444a-bcba-1a9225551767" />|

## 구현 방법
- HStack alignment를 따로 SOT로 관리, 기본값은 top
- 텍스트 VStack의 overlay에 GeometryReader를 설정, VStack의 크기 확인
- 크기가 이미지 높이인 80을 넘기면 alignment center로 변경
```swift
struct ContentView: View {
    @State private var alignment: VerticalAlignment = .top
    
    var body: some View {
        HStack(alignment: alignment) {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            VStack {
                Text("Hello")
                Text("World")
            }
            .overlay {
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            if geometry.size.height > 80 {
                                alignment = .center
                            }
                        }
                }
            }
        }
        .padding(16)
        .background(Color.yellow)
    }
}
```

## 구현 결과
- 아래와 같이 텍스트 VStack의 크기에 따라 다른 alignment를 보여주도록 구현할 수 있었습니다.

| top | center |
| -- | -- |
|<img width="139" alt="Screenshot 2025-01-09 at 8 24 06 PM" src="https://github.com/user-attachments/assets/9ff8657d-a466-4c88-8844-5feb423a61f0" />|<img width="141" alt="Screenshot 2025-01-09 at 8 24 42 PM" src="https://github.com/user-attachments/assets/4967a975-47f2-444a-bcba-1a9225551767" />|
