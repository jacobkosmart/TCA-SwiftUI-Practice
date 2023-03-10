## TCA Practice

๐ TCA ์ ๋ํ ์์ธํ ์ค๋ช : []()

### Project ์ TCA Setting

- ์ต์ข๋จ๊ณ App ์์ Package Dependency๋ก ์ด๋ํด์ ๋ํ๊ธฐ ๋๋ฌ์ TCA Github ๋ฅผ ์ถ๊ฐํด์ ํจํค์ง ์ค์น ์งํ

<img width="1158" alt="image" src="https://user-images.githubusercontent.com/28912774/216803455-11cf706f-0aeb-440c-8e90-f234d05a8b4f.png">

<img width="1336" alt="image" src="https://user-images.githubusercontent.com/28912774/216803475-b1fcc6ae-f2a3-48a8-b681-9114b8adef5c.png">

### ์ค์ต1. Counter App ๋ง๋ค๊ธฐ

```swift
import SwiftUI
import ComposableArchitecture

@main
struct TCA_PracticeApp: App {

	// MARK: - STORE ์์ฑ
	// ์ต์์ App ๋ ๋ฒจ์์ Store ์์ฑ
	// ์ด๊ธฐ State ๊ฐ ์ค์ 
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

// MARK: - ACTION : ํ์์ ์ข๋ฅ๋ณ๋ก ๋๋๊ธฐ enum ์ผ๋ก ์ฒ๋ฆฌ
enum CounterAction: Equatable {
	case addCount // ์นด์ดํธ๋ฅผ ๋ํ๊ธฐ
	case subtractCount // ์นด์ดํธ๋ฅผ ๋นผ๊ธฐ
}

// MARK: - REDUCER
let counterReduce = Reduce<CounterState, CounterAction> {state, action in
	// ๋ค์ด์จ ์ก์์ ๋ฐ๋ผ ์ํ๋ฅผ ๋ณ๊ฒฝ
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
	// View์์ Store ๋ฅผ ๊ฐ์ง๊ณ  ์์
	let store: Store<CounterState, CounterAction>

    var body: some View {
		// WithViewStore : View ์์์ Store ๋ฅผ ๋ฐ์ ์ ์๋ Observable ์ญํ์ ํจ
		WithViewStore(self.store) { viewStore in

			VStack (spacing: 20) {
				Text("Count: \(viewStore.state.count)")

				HStack (spacing: 10) {
					Button {
						viewStore.send(.addCount)
					} label: {
						Text("๋ํ๊ธฐ")
					}

					Button {
						viewStore.send(.subtractCount)
					} label: {
						Text("๋นผ๊ธฐ")
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

- <img height="350" alt="แแณแแณแแตแซแแฃแบ" src="">

<!-- ๐ถ ๐ท ๐ ๐ ๐ -->

## ๐ Reference

๊ฐ๋ฐํ๋ ์ ๋๋ฆฌ - [https://youtu.be/fYQ9YnbvasU](https://youtu.be/fYQ9YnbvasU)

์ค์ํํธํ์ด - [https://www.youtube.com/watch?v=vU_pRzQMoho](https://www.youtube.com/watch?v=vU_pRzQMoho)

์ฝ๋ ์ค์ฟผ๋ - [https://www.youtube.com/watch?v=2DO420E9lvs](https://www.youtube.com/watch?v=2DO420E9lvs)
