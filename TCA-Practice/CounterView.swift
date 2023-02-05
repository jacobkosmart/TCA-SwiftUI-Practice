//
//  CounterView.swift
//  TCA-Practice
//
//  Created by Jacob Ko on 2023/02/05.
//

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
