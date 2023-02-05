## TCA Practice

👉 TCA 에 대한 자세한 설명 : []()

### Project 에 TCA Setting

- 최종단계 App 에서 Package Dependency로 이동해서 더하기 눌러서 TCA Github 를 추가해서 패키지 설치 진행

<img width="1158" alt="image" src="https://user-images.githubusercontent.com/28912774/216803455-11cf706f-0aeb-440c-8e90-f234d05a8b4f.png">

<img width="1336" alt="image" src="https://user-images.githubusercontent.com/28912774/216803475-b1fcc6ae-f2a3-48a8-b681-9114b8adef5c.png">

### 실습1. Counter App 만들기

```swift
import SwiftUI
import ComposableArchitecture

@main
struct TCA_PracticeApp: App {

	// MARK: - STORE 생성
	// 최상위 App 레벨에서 Store 생성
	// 초기 State 값 설정
	let counterStore = Store(initialState: CounterState(), reducer: counterReduce)

    var body: some Scene {
        WindowGroup {
            CounterView(store: counterStore)
        }
    }
}

```

```swift
import SwiftUI
import ComposableArchitecture

// MARK: - STATE
struct CounterState: Equatable {
	var count = 0
}


// MARK: - ENVIRONMENT
//struct CounterEnvironment {}

// MARK: - ACTION : 타입을 종류별로 나누기 enum 으로 처리
enum CounterAction: Equatable {
	case addCount // 카운트를 더하기
	case subtractCount // 카운트를 빼기
}

// MARK: - REDUCER
let counterReduce = Reduce<CounterState, CounterAction> {state, action in
	// 들어온 액션에 따라 상태를 변경
	switch action {
	case .addCount:
		state.count += 1
		return EffectTask.none

	case .subtractCount:
		state.count -= 1
		return EffectTask.none
	}
}

struct CounterView: View {

	// MARK: - STORE
	// View에서 Store 를 가지고 있음
	let store: Store<CounterState, CounterAction>

    var body: some View {
		// WithViewStore : View 안에서 Store 를 받을 수 있는 Observable 역활을 함
		WithViewStore(self.store) { viewStore in

			VStack (spacing: 20) {
				Text("Count: \(viewStore.state.count)")

				HStack (spacing: 10) {
					Button {
						viewStore.send(.addCount)
					} label: {
						Text("더하기")
					}

					Button {
						viewStore.send(.subtractCount)
					} label: {
						Text("빼기")
					}

				} //: HSTACK
			} //: VSTACK
		} //: VIEWSTORE

    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
		CounterView(store: Store(initialState: CounterState(), reducer: counterReduce))
    }
}

```

![Kapture 2023-02-05 at 15 12 49](https://user-images.githubusercontent.com/28912774/216804691-60a010f2-0bad-47e2-a52f-9e5c362213c7.gif)

```swift

```

```swift

```

```swift

```

```swift

```

```swift

```

- <img height="350" alt="스크린샷" src="">

<!-- 🔶 🔷 📌 🔑 👉 -->

## 🗃 Reference

개발하는 정대리 - [https://youtu.be/fYQ9YnbvasU](https://youtu.be/fYQ9YnbvasU)

스위프트하이 - [https://www.youtube.com/watch?v=vU_pRzQMoho](https://www.youtube.com/watch?v=vU_pRzQMoho)

코드 스쿼드 - [https://www.youtube.com/watch?v=2DO420E9lvs](https://www.youtube.com/watch?v=2DO420E9lvs)
